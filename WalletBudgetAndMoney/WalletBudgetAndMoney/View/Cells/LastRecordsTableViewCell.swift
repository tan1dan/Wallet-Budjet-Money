//
//  LastRecordsTableViewCell.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 22/04/2024.
//

import UIKit

class LastRecordsTableViewCell: UITableViewCell {
    
    static let id = "LastRecordsTableViewCell"
    
    let imageViewRecords = UIImageView()
    let labelCategoryLastRecords = UILabel()
    let labelDescriptionLastRecords = UILabel()
    let labelAmountLastRecords = UILabel()
    let labelDateLastRecords = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutCell()

        imageViewRecords.layer.cornerRadius = 20
        imageViewRecords.layer.masksToBounds = true
        labelCategoryLastRecords.numberOfLines = 0
    }
    
    private func layoutCell(){
        imageViewRecords.translatesAutoresizingMaskIntoConstraints = false
        labelCategoryLastRecords.translatesAutoresizingMaskIntoConstraints = false
        labelDescriptionLastRecords.translatesAutoresizingMaskIntoConstraints = false
        labelAmountLastRecords.translatesAutoresizingMaskIntoConstraints = false
        labelDateLastRecords.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageViewRecords)
        contentView.addSubview(labelCategoryLastRecords)
        contentView.addSubview(labelDescriptionLastRecords)
        contentView.addSubview(labelAmountLastRecords)
        contentView.addSubview(labelDateLastRecords)
        
        NSLayoutConstraint.activate([
            imageViewRecords.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageViewRecords.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
           
            imageViewRecords.widthAnchor.constraint(equalTo: imageViewRecords.heightAnchor, multiplier: 1),
            imageViewRecords.widthAnchor.constraint(equalToConstant: 40),
            
            labelCategoryLastRecords.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            labelCategoryLastRecords.leadingAnchor.constraint(equalTo: imageViewRecords.trailingAnchor, constant: 5),
            labelCategoryLastRecords.trailingAnchor.constraint(equalTo: labelAmountLastRecords.leadingAnchor, constant: -5),
            labelCategoryLastRecords.heightAnchor.constraint(equalTo: labelDescriptionLastRecords.heightAnchor, multiplier: 1),
            
            labelDescriptionLastRecords.topAnchor.constraint(equalTo: labelCategoryLastRecords.bottomAnchor, constant: 5),
            labelDescriptionLastRecords.leadingAnchor.constraint(equalTo: imageViewRecords.trailingAnchor, constant: 5),
            labelDescriptionLastRecords.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            labelDescriptionLastRecords.trailingAnchor.constraint(equalTo: labelDateLastRecords.leadingAnchor, constant: -5),
            
            labelAmountLastRecords.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            labelAmountLastRecords.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            labelAmountLastRecords.heightAnchor.constraint(equalTo: labelDateLastRecords.heightAnchor, multiplier: 1),
            
            labelDateLastRecords.topAnchor.constraint(equalTo: labelAmountLastRecords.bottomAnchor, constant: 5),
            labelDateLastRecords.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            labelDateLastRecords.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
