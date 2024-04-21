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
        layout()
        //Example
        logoView.backgroundColor = .red
//        imageView.backgroundColor = .red
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
    
    private func layout(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        logoView.translatesAutoresizingMaskIntoConstraints = false
        labelAccountType.translatesAutoresizingMaskIntoConstraints  = false
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        labelCurrency.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoView)
        logoView.addSubview(imageView)
        addSubview(labelAccountType)
        addSubview(labelAmount)
        addSubview(labelCurrency)
        
        
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            logoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoView.widthAnchor.constraint(equalTo: logoView.heightAnchor, multiplier: 1),
            logoView.heightAnchor.constraint(equalToConstant: self.frame.size.width / 4),
            
            labelAccountType.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 5),
            labelAccountType.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelAccountType.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            labelAmount.topAnchor.constraint(equalTo: labelAccountType.bottomAnchor, constant: 5),
            labelAmount.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelAmount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            labelCurrency.topAnchor.constraint(equalTo: labelAmount.bottomAnchor, constant: 5),
            labelCurrency.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelCurrency.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            labelCurrency.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
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
