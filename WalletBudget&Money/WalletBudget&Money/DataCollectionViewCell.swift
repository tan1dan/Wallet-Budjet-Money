//
//  DataCollectionViewCell.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 19/04/2024.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    let tableViewLastRecords = UITableView()
    let labelLastRecords = UILabel()
    let buttonShowMoreLastRecords = UIButton()
    var data: [CellItem] = []
    
    static let id = "DataCollectionViewCell"
    
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
        
        labelLastRecords.attributedText = stringToNSAttributedString(string: "Последние записи", size: 26, weight: .bold, color: .black)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutLastRecords(){
        tableViewLastRecords.translatesAutoresizingMaskIntoConstraints = false
        labelLastRecords.translatesAutoresizingMaskIntoConstraints = false
        buttonShowMoreLastRecords.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableViewLastRecords)
        addSubview(labelLastRecords)
        addSubview(buttonShowMoreLastRecords)
        
        NSLayoutConstraint.activate([
            labelLastRecords.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labelLastRecords.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            
            tableViewLastRecords.topAnchor.constraint(equalTo: labelLastRecords.bottomAnchor, constant: 20),
            tableViewLastRecords.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableViewLastRecords.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableViewLastRecords.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
}

extension DataCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LastRecordsTableViewCell.id, for: indexPath) as! LastRecordsTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func stringToNSAttributedString(string: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) -> NSMutableAttributedString {
        let ns = NSMutableAttributedString(string: string)
        let range = (ns.string as NSString).range(of: string)
        ns.addAttribute(.font, value: UIFont.systemFont(ofSize: size, weight: weight), range: range)
        ns.addAttribute(.foregroundColor, value: color, range: range)
        return ns
    }
}
