//
//  ChangeBalanceViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 27/04/2024.
//

import UIKit

class ChangeBalanceViewController: UIViewController {
    
    let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.insertSegment(withTitle: "Расход", at: 0, animated: false)
        segment.insertSegment(withTitle: "Доход", at: 1, animated: false)
        segment.insertSegment(withTitle: "Перевод", at: 2, animated: false)
        segment.selectedSegmentIndex = 0
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
        label.attributedText = UIView.stringToNSAttributedString(string: "-0", size: 70, weight: .semibold, color: .white)
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConstraints()
        nvParameters()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChangeBalanceTableViewCell.self, forCellReuseIdentifier: ChangeBalanceTableViewCell.id)
        tableView.register(ChangeBalanceDateTableViewCell.self, forCellReuseIdentifier: ChangeBalanceDateTableViewCell.id)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonSave.layer.cornerRadius = buttonSave.frame.size.height / 4
    }
    
    private func nvParameters(){
        navigationItem.title = "Добавить запись"
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
    func doSomethingWithData(data: String) {
        
    }
}


extension ChangeBalanceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row <= 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceTableViewCell.id, for: indexPath) as! ChangeBalanceTableViewCell
            cell.imageViewCategory.image = UIImage(resource: .transactions)
            cell.labelCategory.text = "Счёт"
            cell.labelSelect.text = "Santander"
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChangeBalanceDateTableViewCell.id, for: indexPath) as! ChangeBalanceDateTableViewCell
            cell.imageViewCategory.image = UIImage(systemName: "calendar")
            cell.imageViewCategory.layer.cornerRadius = 0
            cell.imageViewCategory.tintColor = .systemGray2
            cell.labelCategory.text = "Дата"
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
