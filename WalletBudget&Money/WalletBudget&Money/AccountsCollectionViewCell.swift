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
    var isAddCell: Bool?
    let labelAddCell = UILabel()
    let logoViewAddCell = UIView()
    let imageViewAddCell = UIImageView(image: UIImage(systemName: "plus"))
    var counterLayout = 0
    let logoViewAddCellHeight: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layerParameters()
        logoViewParameters()
        logoViewAddCellParameters()
        
        //Example
        logoView.backgroundColor = .red
//        imageView.backgroundColor = .red
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "centsign.circle")
        labelAccountType.text = "Наличные"
        labelAmount.text = String(10.00)
        labelCurrency.text = "PLN"
        labelAddCell.text = "Добавить счет"
        imageViewAddCell.tintColor = .white
        //
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (isAddCell ?? false) && (counterLayout == 0) {
            layoutAddCell()
            counterLayout = 1
        } else if !(isAddCell ?? false) && (counterLayout == 0) {
            layoutUsual()
            counterLayout = 1
        }
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
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            logoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoView.widthAnchor.constraint(equalTo: logoView.heightAnchor, multiplier: 1),
            logoView.heightAnchor.constraint(equalToConstant: self.frame.size.width / 4),
            
            labelAccountType.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 1),
            labelAccountType.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelAccountType.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            labelAmount.topAnchor.constraint(equalTo: labelAccountType.bottomAnchor, constant: 1),
            labelAmount.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            labelAmount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            labelCurrency.topAnchor.constraint(equalTo: labelAmount.bottomAnchor, constant: 1),
            labelCurrency.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelCurrency.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            labelCurrency.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            imageView.centerXAnchor.constraint(equalTo: logoView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
            imageView.heightAnchor.constraint(equalToConstant: self.frame.size.width / 5),
        ])
    }
    
    private func layoutAddCell(){
        labelAddCell.translatesAutoresizingMaskIntoConstraints = false
        logoViewAddCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewAddCell.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelAddCell)
        contentView.addSubview(logoViewAddCell)
        logoViewAddCell.addSubview(imageViewAddCell)
        
        NSLayoutConstraint.activate([
            logoViewAddCell.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoViewAddCell.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            logoViewAddCell.widthAnchor.constraint(equalTo: logoViewAddCell.heightAnchor, multiplier: 1),
            logoViewAddCell.widthAnchor.constraint(equalToConstant: logoViewAddCellHeight),
            
            imageViewAddCell.centerXAnchor.constraint(equalTo: logoViewAddCell.centerXAnchor),
            imageViewAddCell.centerYAnchor.constraint(equalTo: logoViewAddCell.centerYAnchor),
            
            labelAddCell.topAnchor.constraint(equalTo: logoViewAddCell.bottomAnchor, constant: 5),
            labelAddCell.centerXAnchor.constraint(equalTo: logoViewAddCell.centerXAnchor),
        ])
    }
    
    private func logoViewParameters(){
        logoView.layer.cornerRadius = 10
    }
    
    private func logoViewAddCellParameters(){
        logoViewAddCell.backgroundColor = .systemBlue
        logoViewAddCell.layer.cornerRadius = logoViewAddCellHeight / 2
    }
    
    func stringToNSAttributedString(string: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) -> NSMutableAttributedString {
        let ns = NSMutableAttributedString(string: string)
        let range = (ns.string as NSString).range(of: string)
        ns.addAttribute(.font, value: UIFont.systemFont(ofSize: size, weight: weight), range: range)
        ns.addAttribute(.foregroundColor, value: color, range: range)
        return ns
    }
}
