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
        //Example
        imageViewRecords.image = UIImage(resource: .transactions)
        imageViewRecords.layer.cornerRadius = 20
        imageViewRecords.layer.masksToBounds = true
        labelCategoryLastRecords.text = "Перевести, снять"
        labelCategoryLastRecords.numberOfLines = 0
        labelDescriptionLastRecords.attributedText = stringToNSAttributedString(string: "Наличные -> Santander", size: 14, weight: .bold, color: .gray)
        labelAmountLastRecords.attributedText = stringToNSAttributedString(string: "1112.00", size: 17, weight: .bold, color: .systemGreen)
        labelDateLastRecords.attributedText = stringToNSAttributedString(string: "18.04.2024", size: 14, weight: .semibold, color: .gray)
        //
    }
    
    private func layoutCell(){
        imageViewRecords.translatesAutoresizingMaskIntoConstraints = false
        labelCategoryLastRecords.translatesAutoresizingMaskIntoConstraints = false
        labelDescriptionLastRecords.translatesAutoresizingMaskIntoConstraints = false
        labelAmountLastRecords.translatesAutoresizingMaskIntoConstraints = false
        labelDateLastRecords.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageViewRecords)
        addSubview(labelCategoryLastRecords)
        addSubview(labelDescriptionLastRecords)
        addSubview(labelAmountLastRecords)
        addSubview(labelDateLastRecords)
        
        NSLayoutConstraint.activate([
            imageViewRecords.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageViewRecords.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
           
            imageViewRecords.widthAnchor.constraint(equalTo: imageViewRecords.heightAnchor, multiplier: 1),
            imageViewRecords.widthAnchor.constraint(equalToConstant: 40),
            
            labelCategoryLastRecords.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            labelCategoryLastRecords.leadingAnchor.constraint(equalTo: imageViewRecords.trailingAnchor, constant: 5),
            labelCategoryLastRecords.trailingAnchor.constraint(equalTo: labelAmountLastRecords.leadingAnchor, constant: -5),
            labelCategoryLastRecords.heightAnchor.constraint(equalTo: labelDescriptionLastRecords.heightAnchor, multiplier: 1),
            
            labelDescriptionLastRecords.topAnchor.constraint(equalTo: labelCategoryLastRecords.bottomAnchor, constant: 5),
            labelDescriptionLastRecords.leadingAnchor.constraint(equalTo: imageViewRecords.trailingAnchor, constant: 5),
            labelDescriptionLastRecords.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            labelDescriptionLastRecords.trailingAnchor.constraint(equalTo: labelDateLastRecords.leadingAnchor, constant: -5),
            
            labelAmountLastRecords.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            labelAmountLastRecords.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            labelAmountLastRecords.heightAnchor.constraint(equalTo: labelDateLastRecords.heightAnchor, multiplier: 1),
            
            labelDateLastRecords.topAnchor.constraint(equalTo: labelAmountLastRecords.bottomAnchor, constant: 5),
            labelDateLastRecords.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            labelDateLastRecords.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stringToNSAttributedString(string: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) -> NSMutableAttributedString {
        let ns = NSMutableAttributedString(string: string)
        let range = (ns.string as NSString).range(of: string)
        ns.addAttribute(.font, value: UIFont.systemFont(ofSize: size, weight: weight), range: range)
        ns.addAttribute(.foregroundColor, value: color, range: range)
        return ns
    }
}
