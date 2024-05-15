//
//  AccountsCollectionViewCell.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 19/04/2024.
//

import UIKit

class AccountsCollectionViewCell: UICollectionViewCell {
    static let id = "AccountsCollectionViewCell"
    let imageView = UIImageView()
    let logoView = UIView()
    let labelAccountType = UILabel()
    let labelAmount = UILabel()
    let labelCurrency = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layerParameters()
        logoViewParameters()
        layoutUsual()
        
        //Example
        logoView.backgroundColor = .red
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "centsign.circle")
        labelAccountType.text = "Наличные"
        labelAmount.text = String(10.00)
        labelCurrency.text = "PLN"
        //
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layerParameters(){
        layer.cornerRadius = frame.size.width / 5
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4
    }
    
    private func layoutUsual(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        logoView.translatesAutoresizingMaskIntoConstraints = false
        labelAccountType.translatesAutoresizingMaskIntoConstraints  = false
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        labelCurrency.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logoView)
        logoView.addSubview(imageView)
        contentView.addSubview(labelAccountType)
        contentView.addSubview(labelAmount)
        contentView.addSubview(labelCurrency)
        
        
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            logoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            logoView.widthAnchor.constraint(equalTo: logoView.heightAnchor, multiplier: 1),
            logoView.heightAnchor.constraint(equalToConstant: self.frame.size.width / 4),
            
            labelAccountType.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 1),
            labelAccountType.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelAccountType.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            labelAmount.topAnchor.constraint(equalTo: labelAccountType.bottomAnchor, constant: 1),
            labelAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            labelAmount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            labelCurrency.topAnchor.constraint(equalTo: labelAmount.bottomAnchor, constant: 1),
            labelCurrency.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelCurrency.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelCurrency.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            imageView.centerXAnchor.constraint(equalTo: logoView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
            imageView.heightAnchor.constraint(equalToConstant: self.frame.size.width / 5),
        ])
    }
    
    private func logoViewParameters(){
        logoView.layer.cornerRadius = 10
    }
    
}
