//
//  HeaderView.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 27/04/2024.
//

import UIKit

class HeaderView: UIView {
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "18.04.2025", size: 17, weight: .semibold, color: .systemGray3)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
