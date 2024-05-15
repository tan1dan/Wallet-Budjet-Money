//
//  LastRecordsViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 26/04/2024.
//

import UIKit

class LastRecordsViewController: UIViewController {
    var data: [Transaction] = []
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nvParameters()
        var transactions: [Transaction] = []
        let accounts = Model.shared.accounts
        for account in accounts {
            transactions += account.transactions ?? []
        }
        transactions.sort(by: {$0.date > $1.date})
        data = transactions
        layoutLastRecords()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(LastRecordsTableViewCell.self, forCellReuseIdentifier: LastRecordsTableViewCell.id)
    }
    
    private func layoutLastRecords(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
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
            label.attributedText = UIView.stringToNSAttributedString(string: "Транзакции", size: 18, weight: .semibold , color: .black)
            return view
        }()
        navigationController?.navigationBar.tintColor = .black
    }
    
}

extension LastRecordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LastRecordsTableViewCell.id, for: indexPath) as! LastRecordsTableViewCell
        cell.selectionStyle = .none
        var color = UIColor()
        if data[indexPath.row].category == .extense {
            cell.imageViewRecords.image = UIImage(resource: .expenses)
            
            color = .systemRed
        } else {
            cell.imageViewRecords.image = UIImage(resource: .income)
            
            color = .systemGreen
        }
        cell.labelCategoryLastRecords.text = data[indexPath.row].name
        let amountRounding = Double(round(100 * data[indexPath.row].amount) / 100)
        cell.labelAmountLastRecords.attributedText = UIView.stringToNSAttributedString(string: "\(amountRounding) zł", size: 17, weight: .bold, color: color)
        cell.labelDateLastRecords.attributedText = UIView.stringToNSAttributedString(string: data[indexPath.row].date.formatted(date: .omitted, time: .omitted), size: 14, weight: .semibold, color: .gray)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
