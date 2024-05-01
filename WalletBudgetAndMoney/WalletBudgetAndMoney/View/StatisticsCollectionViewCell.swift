//
//  StatisticsCollectionViewCell.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 30/04/2024.
//

import UIKit

class StatisticsCollectionViewCell: UICollectionViewCell {
    
    static let id = "StatisticsCollectionViewCell"
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "Доход", size: 18, weight: .medium, color: .systemGray2)
        return label
    }()
    
    let labelAmount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "2450.00", size: 25, weight: .bold, color: .black)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 30
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 4
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutConstraints(){
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelAmount)
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            labelAmount.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 5),
            labelAmount.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            labelAmount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
}
