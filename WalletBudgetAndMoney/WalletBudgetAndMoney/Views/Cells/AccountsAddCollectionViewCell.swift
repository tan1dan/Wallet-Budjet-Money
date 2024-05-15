//
//  AccountsAddCollectionViewCell.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 25/04/2024.
//

import UIKit

class AccountsAddCollectionViewCell: UICollectionViewCell {
    
    let labelAddCell = UILabel()
    let logoViewAddCell = UIView()
    let imageViewAddCell = UIImageView(image: UIImage(systemName: "plus"))
    let logoViewAddCellHeight: CGFloat = 40
    var logoViewAddCellPressed: (() -> Void)?
    static let id = "AccountsAddCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layerParameters()
        layoutAddCell()
        logoViewAddCellParameters()
        labelAddCell.text = "Добавить счет"
        imageViewAddCell.tintColor = .white
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(logoViewAddCellAction)))
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
    
    private func layoutAddCell(){
        labelAddCell.translatesAutoresizingMaskIntoConstraints = false
        logoViewAddCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewAddCell.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelAddCell)
        contentView.addSubview(logoViewAddCell)
        logoViewAddCell.addSubview(imageViewAddCell)
        
        NSLayoutConstraint.activate([
            logoViewAddCell.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoViewAddCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            logoViewAddCell.widthAnchor.constraint(equalTo: logoViewAddCell.heightAnchor, multiplier: 1),
            logoViewAddCell.widthAnchor.constraint(equalToConstant: logoViewAddCellHeight),
            
            imageViewAddCell.centerXAnchor.constraint(equalTo: logoViewAddCell.centerXAnchor),
            imageViewAddCell.centerYAnchor.constraint(equalTo: logoViewAddCell.centerYAnchor),
            
            labelAddCell.topAnchor.constraint(equalTo: logoViewAddCell.bottomAnchor, constant: 5),
            labelAddCell.centerXAnchor.constraint(equalTo: logoViewAddCell.centerXAnchor),
        ])
    }
    
    private func logoViewAddCellParameters(){
        logoViewAddCell.backgroundColor = .systemBlue
        logoViewAddCell.layer.cornerRadius = logoViewAddCellHeight / 2
    }
    
    @objc private func logoViewAddCellAction(){
        logoViewAddCellPressed?()
    }
}
