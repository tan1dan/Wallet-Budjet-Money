//
//  LastRecordsCollectionViewCell.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 25/04/2024.
//

import UIKit

class LastRecordsCollectionViewCell: UICollectionViewCell {
    
    let tableViewLastRecords = UITableView()
    let labelLastRecords = UILabel()
    let buttonShowMoreLastRecords = UIButton()

    var data: [Transaction] = []
    var buttonShowMorePressed: (() -> Void)?
    
    static let id = "LastRecordsCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = frame.size.width / 7
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4
        
        layoutLastRecords()
        tableViewLastRecords.dataSource = self
        tableViewLastRecords.delegate = self
        tableViewLastRecords.showsVerticalScrollIndicator = false
        tableViewLastRecords.register(LastRecordsTableViewCell.self, forCellReuseIdentifier: LastRecordsTableViewCell.id)
        
        labelLastRecords.attributedText = UIView.stringToNSAttributedString(string: "Последние записи", size: 26, weight: .bold, color: .black)
        buttonShowMoreLastRecordsParameters()
        
    }
    
    private func layoutLastRecords(){
        tableViewLastRecords.translatesAutoresizingMaskIntoConstraints = false
        labelLastRecords.translatesAutoresizingMaskIntoConstraints = false
        buttonShowMoreLastRecords.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tableViewLastRecords)
        contentView.addSubview(labelLastRecords)
        contentView.addSubview(buttonShowMoreLastRecords)
        
        NSLayoutConstraint.activate([
            labelLastRecords.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelLastRecords.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            
            tableViewLastRecords.topAnchor.constraint(equalTo: labelLastRecords.bottomAnchor, constant: 10),
            tableViewLastRecords.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            tableViewLastRecords.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            tableViewLastRecords.heightAnchor.constraint(equalToConstant: 70 * 3),
            
            
            buttonShowMoreLastRecords.topAnchor.constraint(equalTo: tableViewLastRecords.bottomAnchor, constant: 5),
            buttonShowMoreLastRecords.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            buttonShowMoreLastRecords.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    private func buttonShowMoreLastRecordsParameters(){
        buttonShowMoreLastRecords.setAttributedTitle(UIView.stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
        buttonShowMoreLastRecords.addTarget(nil, action: #selector(buttonShowMoreAction), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var transactions: [Transaction] = []
        let accounts = Model.shared.accounts
        for account in accounts {
            transactions += account.transactions ?? []
        }
        transactions.sort(by: {$0.date > $1.date})
        var endedTransactions: [Transaction] = []
        if transactions.count >= 3 {
            for i in 0...2 {
                endedTransactions.append(transactions[i])
            }
        } else {
            endedTransactions = transactions
        }
        data = endedTransactions
        tableViewLastRecords.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonShowMoreAction(){
        buttonShowMorePressed?()
    }
    
}

extension LastRecordsCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    
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
