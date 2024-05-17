//
//  SettingsAccountViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 03/05/2024.
//

import UIKit

class SettingsAccountViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let buttonSave: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "Сохранить", size: 18, weight: .bold, color: .white), for: .normal)
        button.addTarget(nil, action: #selector(buttonSaveTapped), for: .touchUpInside)
        return button
    }()
    
    let saveView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .systemGray3
        view.addSubview(separator)
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: view.topAnchor),
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
        ])
        return view
    }()
    
    var data: [SettingsItem] = [SettingsItem(id: "0", text: "Мой счет"), SettingsItem(id: "1", text: "0"), SettingsItem(id: "2", text: "Наличные", image: UIImage(systemName: "banknote")), SettingsItem(id: "3", text: "PLN")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChangeBalanceTableViewCell.self, forCellReuseIdentifier: ChangeBalanceTableViewCell.id)
        tableView.separatorColor = .systemGray2
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        nvParameters()
        layoutConstraints()
    }
    
    private func layoutConstraints(){
        saveView.addSubview(buttonSave)
        view.addSubview(tableView)
        view.addSubview(saveView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            
            saveView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            saveView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            saveView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            saveView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            saveView.heightAnchor.constraint(equalToConstant: 50),
            
            buttonSave.topAnchor.constraint(equalTo: saveView.topAnchor, constant: 10),
            buttonSave.trailingAnchor.constraint(equalTo: saveView.trailingAnchor, constant: -15),
            buttonSave.leadingAnchor.constraint(equalTo: saveView.leadingAnchor, constant: 15),
            buttonSave.bottomAnchor.constraint(equalTo: saveView.bottomAnchor),
            
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonSave.layer.cornerRadius = buttonSave.frame.size.height / 4
    }
    
    private func nvParameters(){
        navigationItem.titleView = {
            let view = UIView()
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.topAnchor),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
            label.attributedText = UIView.stringToNSAttributedString(string: "Добавить запись", size: 18, weight: .semibold , color: .black)
            return view
        }()
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    @objc func buttonSaveTapped(){
        let model = Model.shared
        
        model.accounts.append(AccountItem(id: UUID().uuidString, image: data[2].image!.pngData(), name: data[0].text!, amount: Double(data[1].text!) ?? (0), currency: data[3].text!, transactions: [Transaction(id: UUID().uuidString, nameOfAccount: data[0].text!, name: "Начальные деньги", type: .income, category: .income, date: Date(), amount: Double(data[1].text!) ?? 0, restAmount: Double(data[1].text!) ?? 0)]))
        UserDefaultsManager.shared.create(object: Model.shared.accounts, key: UserDefaultsManager.key)
        navigationController?.popViewController(animated: true)
    }
}

extension SettingsAccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.imageViewCategory.image = UIImage(resource: .imageT)
            cell.imageViewCategory.layer.cornerRadius = 40 / 2
            cell.labelCategory.text = "Название счета"
            cell.labelSelect.text = data[indexPath.row].text
            cell.labelSelect.textColor = .systemGray2
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.imageViewCategory.image = UIImage(systemName: "plusminus")
            cell.imageViewCategory.tintColor = .systemGray2
            cell.imageViewCategory.layer.cornerRadius = 0
            cell.labelCategory.text = "Текущий баланс"
            cell.labelSelect.text = data[indexPath.row].text
            cell.labelSelect.textColor = .systemGray2
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.imageViewCategory.image = data[indexPath.row].image
            cell.imageViewCategory.tintColor = .systemGray2
            cell.imageViewCategory.layer.cornerRadius = 0
            cell.labelCategory.text = "Тип"
            cell.labelSelect.text = data[indexPath.row].text
            cell.labelSelect.textColor = .systemGray2
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.imageViewCategory.image = UIImage(systemName: "coloncurrencysign.arrow.circlepath")
            cell.imageViewCategory.tintColor = .systemGray2
            cell.imageViewCategory.layer.cornerRadius = 0
            cell.labelCategory.text = "Валюта"
            cell.labelSelect.text = data[indexPath.row].text
            cell.labelSelect.textColor = .systemGray2
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = ChooseDataViewController()
            vc.textView.text = data[indexPath.row].text
            vc.closure = { [weak self] text in
                self?.data[indexPath.row].text = text
                self?.tableView.reloadData()
            }
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.setNavigationBarHidden(false, animated: false)
        } else if indexPath.row == 1 {
            let vc = FirstBalanceViewController()
            vc.amountLabel.attributedText = UIView.stringToNSAttributedString(string: data[indexPath.row].text ?? "0", size: 70, weight: .semibold, color: .white)
            vc.closure = { [weak self] text in
                self?.data[indexPath.row].text = text
                self?.tableView.reloadData()
            }
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.setNavigationBarHidden(false, animated: false)
        } else if indexPath.row == 2 {
            let vc = AccountTypeViewController()
            vc.closure = { [weak self] text, image in
                self?.data[indexPath.row].text = text
                self?.data[indexPath.row].image = image
                self?.tableView.reloadData()
            }
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.setNavigationBarHidden(false, animated: false)
        } else if indexPath.row == 3 {
            let vc = CurrencyViewController()
            vc.closure = { [weak self] text in
                self?.data[indexPath.row].text = text
                self?.tableView.reloadData()
            }
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.setNavigationBarHidden(false, animated: false)
        }
    }
    
}
