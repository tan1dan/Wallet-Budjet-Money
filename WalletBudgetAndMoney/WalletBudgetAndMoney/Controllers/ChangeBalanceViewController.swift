//
//  ChangeBalanceViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 27/04/2024.
//

import UIKit

class ChangeBalanceViewController: UIViewController {
    
    let customKeyboard = CustomKeyboardViewController()
    
    var data: [SettingsItem] = [SettingsItem(id: "0", text: "Счет"), SettingsItem(id: "1", text: "Требуется"), SettingsItem(date: Date())]
    
    let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.insertSegment(withTitle: "Расход", at: 0, animated: false)
        segment.insertSegment(withTitle: "Доход", at: 1, animated: false)
        segment.selectedSegmentIndex = 0
        segment.addTarget(nil, action: #selector(segmentControlChanged), for: .valueChanged)
        return segment
    }()
    
    let buttonCurrency: UIButton = {
        let butt = UIButton(type: .system)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.setAttributedTitle(UIView.stringToNSAttributedString(string: "PLN", size: 20, weight: .light, color: .black), for: .normal)
        butt.backgroundColor = .white
        butt.layer.cornerRadius = 70/4
        NSLayoutConstraint.activate([
            butt.widthAnchor.constraint(equalToConstant: 70),
            butt.heightAnchor.constraint(equalTo: butt.widthAnchor, multiplier: 1/2)
        ])
        return butt
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "0", size: 70, weight: .semibold, color: .white)
        label.isUserInteractionEnabled = true
        label.textAlignment = .right
        return label
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonSave: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "Сохранить", size: 18, weight: .bold, color: .white), for: .normal)
        button.addTarget(self, action: #selector(buttonSaveTapped), for: .touchUpInside)
        return button
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        return view
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
    
    var labeTextHeight: CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConstraints()
        nvParameters()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChangeBalanceTableViewCell.self, forCellReuseIdentifier: ChangeBalanceTableViewCell.id)
        tableView.register(ChangeBalanceDateTableViewCell.self, forCellReuseIdentifier: ChangeBalanceDateTableViewCell.id)
        amountLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelAmountTapped)))
        customKeyboard.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonSave.layer.cornerRadius = buttonSave.frame.size.height / 4
    }
    
    @objc func segmentControlChanged(){
        if segmentedControl.selectedSegmentIndex == 1 {
            headerView.backgroundColor = .systemGreen
            data[1].text = "Требуется"
            tableView.reloadData()
        } else if segmentedControl.selectedSegmentIndex == 0 {
            headerView.backgroundColor = .red
            data[1].text = "Требуется"
            tableView.reloadData()
        }
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
            label.attributedText = UIView.stringToNSAttributedString(string: "Добавить запись", size: 18, weight: .semibold , color: .white)
            return view
        }()
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    private func layoutConstraints(){
        headerView.addSubview(segmentedControl)
        headerView.addSubview(buttonCurrency)
        headerView.addSubview(amountLabel)
        saveView.addSubview(buttonSave)
        view.addSubview(headerView)
        view.addSubview(tableView)
        view.addSubview(saveView)
        
        
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30),
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            amountLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            amountLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            amountLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),
           
            
            buttonCurrency.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
            buttonCurrency.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
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
    
    func keyboardParameters(){
        addChild(customKeyboard)
    }
    
    @objc func labelAmountTapped(){
        if customKeyboard.isKeyboardVisible == false {
            view.addSubview(customKeyboard.view)
            customKeyboard.view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                customKeyboard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                customKeyboard.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                customKeyboard.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                customKeyboard.view.heightAnchor.constraint(equalToConstant: customKeyboard.buttonHeight * 4)
            ])
            
            customKeyboard.isKeyboardVisible.toggle()
        } else {
            customKeyboard.view.removeFromSuperview()
            
            NSLayoutConstraint.deactivate([
                customKeyboard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                customKeyboard.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                customKeyboard.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                customKeyboard.view.heightAnchor.constraint(equalToConstant: customKeyboard.buttonHeight * 4)
            ])
            
            customKeyboard.isKeyboardVisible.toggle()
        }
    }
    
    @objc private func buttonSaveTapped(){
        guard data[1].text! != "Требуется" else {showAlertVC("Ошибка", description: "Выберите пожалуйста категорию") { bool in }
            return
        }
        guard data[0].text! != "Счет" else {showAlertVC("Ошибка", description: "Выберите пожалуйста счет") { bool in }
            return
        }
        
        var accounts = Model.shared.accounts
        let indexAccount = accounts.firstIndex(where: {$0.name == data[0].text})
        var account = accounts.first(where: {$0.name == data[0].text})
        guard var account = account else {return}
        guard let accountAmount = account.amount else {return}
        guard let amount = Double(amountLabel.text!) else {return}
        
        guard amount > 0 else {showAlertVC("Ошибка", description: "Пожалуйста введите сумму транзакции") { bool in }
        return
        }
        
        let type: Types
        let category: Category
        if segmentedControl.selectedSegmentIndex == 0 {
            guard accountAmount >= amount else {showAlertVC("Ошибка", description: "На счету недостаточно средств") { bool in }
            return
            }
            account.amount = accountAmount - amount
            
            let staticItem = StaticData.expenses.first(where: {$0.text == data[1].text })
            type = staticItem!.type
            category = .extense
            account.transactions?.append(Transaction(id: UUID().uuidString, nameOfAccount: data[0].text!, name: data[1].text!, type: type, category: category, date: data[2].date!, amount: amount, restAmount: account.amount ?? 0))
            accounts[indexAccount ?? 0] = account
            Model.shared.accounts = accounts
            UserDefaultsManager.shared.create(object: Model.shared.accounts, key: UserDefaultsManager.key)
            navigationController?.popViewController(animated: true)
        } else if segmentedControl.selectedSegmentIndex == 1 {
            account.amount = accountAmount + amount
            let staticItem = StaticData.income.first(where: {$0.text == data[1].text })
            type = staticItem!.type
            category = .income
            account.transactions?.append(Transaction(id: UUID().uuidString, nameOfAccount: data[0].text!  ,name: data[1].text!, type: type, category: category, date: data[2].date!, amount: amount, restAmount: account.amount ?? 0))
            accounts[indexAccount ?? 0] = account
            Model.shared.accounts = accounts
            UserDefaultsManager.shared.create(object: Model.shared.accounts, key: UserDefaultsManager.key)
            navigationController?.popViewController(animated: true)
        }
        
    }
}


extension ChangeBalanceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            cell.imageViewCategory.image = UIImage(resource: .imageT)
            cell.labelCategory.text = "Счет"
            cell.labelSelect.text = data[indexPath.row].text ?? ""
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            if segmentedControl.selectedSegmentIndex == 0 {
                cell.imageViewCategory.image = UIImage(resource: .expenses)
            } else if segmentedControl.selectedSegmentIndex == 1 {
                cell.imageViewCategory.image = UIImage(resource: .income)
            }
            cell.labelCategory.text = "Категория"
            cell.labelSelect.text = data[indexPath.row].text ?? ""
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceDateTableViewCell.id, for: indexPath) as! ChangeBalanceDateTableViewCell
            cell.imageViewCategory.image = UIImage(systemName: "calendar")
            cell.imageViewCategory.layer.cornerRadius = 0
            cell.imageViewCategory.tintColor = .systemGray2
            cell.labelCategory.text = "Дата"
            cell.closure = { [weak self] date in
                self?.data[2].date = date
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let vc = ChooseAccountViewController()
            vc.closure = { [weak self] text in
                self?.data[indexPath.row].text = text
                self?.tableView.reloadData()
            }
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.setNavigationBarHidden(false, animated: false)
        } else if indexPath.row == 1 {
            let vc = CategoryViewController()
            if segmentedControl.selectedSegmentIndex == 0 {
                var data: [CategoryItem] = []
                let fad = StaticData.expenses.first(where: {$0.type == .foodAndDrinks})
                let buy = StaticData.expenses.first(where: {$0.type == .buys })
                let home = StaticData.expenses.first(where: {$0.type == .house })
                let transport = StaticData.expenses.first(where: {$0.type == .transport })
                let car = StaticData.expenses.first(where: {$0.type == .car })
                let relax = StaticData.expenses.first(where: {$0.type == .relax })
                let communication = StaticData.expenses.first(where: {$0.type == .communication })
                let finance = StaticData.expenses.first(where: {$0.type == .finance })
                let invest = StaticData.expenses.first(where: {$0.type == .invest })
                
                data.append(fad!)
                data.append(buy!)
                data.append(home!)
                data.append(transport!)
                data.append(car!)
                data.append(relax!)
                data.append(communication!)
                data.append(finance!)
                data.append(invest!)
                vc.data = data
            } else {
                var data: [CategoryItem] = []
                let item = StaticData.income.first(where: {$0.type == .income})
                data.append(item!)
                vc.data = data
            }
            vc.closure = { [weak self] text in
                self?.data[indexPath.row].text = text
                self?.tableView.reloadData()
            }
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.setNavigationBarHidden(false, animated: false)
        }
    }
}

extension ChangeBalanceViewController: CustomKeyboardViewControllerDelegate {
    func buttonPressed(sender: CustomKeyboardViewController, button: UIButton) {
       
            guard let text = button.titleLabel?.text else {return}
            switch text {
            case "<":
                if amountLabel.text?.count ?? 0 >= 2{
                    amountLabel.text?.removeLast()
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: amountLabel.text!, size: labeTextHeight, weight: .semibold, color: .white)
                } else {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: "0", size: labeTextHeight, weight: .semibold, color: .white)
                }
            case ",":
                guard amountLabel.text?.count ?? 0 < 9 else {return}
                if amountLabel.text?.contains(",") ?? true {
                    return
                } else {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: amountLabel.text! + text, size: labeTextHeight , weight: .semibold, color: .white)
                }
                    
            case "0":
                guard amountLabel.text?.count ?? 0 < 9 else {return}
                if amountLabel.text! == "0" {
                    return
                } else {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: amountLabel.text! + text, size: labeTextHeight , weight: .semibold, color: .white)
                }
            default:
                guard amountLabel.text?.count ?? 0 < 9 else {return}
                if amountLabel.text! == "0" {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: text, size: labeTextHeight , weight: .semibold, color: .white)
                } else {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: amountLabel.text! + text, size: labeTextHeight , weight: .semibold, color: .white)
                }
            }
            
            if amountLabel.text?.count ?? 0 >= 6 {
                labeTextHeight = 45
            } else {
                labeTextHeight = 70
            }
        
    }
}
