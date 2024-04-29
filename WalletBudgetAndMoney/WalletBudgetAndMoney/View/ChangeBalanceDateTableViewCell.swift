//
//  ChangeBalanceDateTableViewCell.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 29/04/2024.
//

import UIKit

class ChangeBalanceDateTableViewCell: UITableViewCell {
 
    static let id = "ChangeBalanceDateTableViewCell"
    
    let imageViewCategory: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50 / 2
        view.clipsToBounds = true
        return view
    }()
    
    let labelCategory: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .gray
        return separator
    }()
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutContraints()
        datePickerParameters()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func datePickerParameters(){
        datePicker.datePickerMode = .dateAndTime
        datePicker.date = Date()
        datePicker.maximumDate = Date()
        datePicker.locale = Locale(identifier: "ru_RU")
    }
    
    private func layoutContraints(){
        contentView.addSubview(imageViewCategory)
        contentView.addSubview(labelCategory)
        contentView.addSubview(datePicker)
        contentView.addSubview(separator)
        
        NSLayoutConstraint.activate([
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
        ])
        
        NSLayoutConstraint.activate([
            imageViewCategory.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageViewCategory.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imageViewCategory.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            imageViewCategory.widthAnchor.constraint(equalTo: imageViewCategory.heightAnchor, multiplier: 1),
            
            labelCategory.leadingAnchor.constraint(equalTo: imageViewCategory.trailingAnchor, constant: 10),
            labelCategory.centerYAnchor.constraint(equalTo: imageViewCategory.centerYAnchor),
            
            datePicker.centerYAnchor.constraint(equalTo: labelCategory.centerYAnchor),
            datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
    
}
