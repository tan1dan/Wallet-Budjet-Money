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

    var data: [CellItem] = []
    
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
        
        labelLastRecords.attributedText = self.stringToNSAttributedString(string: "Последние записи", size: 26, weight: .bold, color: .black)
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
            labelLastRecords.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labelLastRecords.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            
            tableViewLastRecords.topAnchor.constraint(equalTo: labelLastRecords.bottomAnchor, constant: 10),
            tableViewLastRecords.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableViewLastRecords.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
            buttonShowMoreLastRecords.topAnchor.constraint(equalTo: tableViewLastRecords.bottomAnchor, constant: 5),
            buttonShowMoreLastRecords.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            buttonShowMoreLastRecords.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func buttonShowMoreLastRecordsParameters(){
        buttonShowMoreLastRecords.setAttributedTitle(stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LastRecordsCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
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
    
    
}
