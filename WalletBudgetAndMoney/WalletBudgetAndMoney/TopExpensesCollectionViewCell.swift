//
//  TopExpensesCollectionViewCell.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 25/04/2024.
//

import UIKit

class TopExpensesCollectionViewCell: UICollectionViewCell {
    
    let labelTopExpenses = UILabel()
    var stackViewTopExpenses = UIStackView()
    let labelDateTopExpenses = UILabel()
    let buttonShowMoreTopExpenses = UIButton()
    
    var data: [CellItem] = []
    
    static let id = "TopExpensesCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = frame.size.width / 7
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 4
        
        layoutTopExpenses()
        viewToStackViewCashFLow(stackView: &stackViewTopExpenses, maxAmount: 500, totalAmount: 500, title: "Ремонт", color: .systemOrange)
        viewToStackViewCashFLow(stackView: &stackViewTopExpenses, maxAmount: 500, totalAmount: 150, title: "Налоги", color: .systemGreen)
        viewToStackViewCashFLow(stackView: &stackViewTopExpenses, maxAmount: 500, totalAmount: 100, title: "Продукты", color: .systemRed)
        buttonShowMoreTopExpensesParameters()
        stackViewTopExpenses.axis = .vertical
        stackViewTopExpenses.distribution = .fillProportionally
        stackViewTopExpenses.spacing = 5
        
        labelTopExpenses.attributedText = stringToNSAttributedString(string: "Топ расходов", size: 26, weight: .bold, color: .black)
        labelDateTopExpenses.attributedText = stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
        )
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutTopExpenses(){
        labelTopExpenses.translatesAutoresizingMaskIntoConstraints = false
        stackViewTopExpenses.translatesAutoresizingMaskIntoConstraints = false
        buttonShowMoreTopExpenses.translatesAutoresizingMaskIntoConstraints = false
        labelDateTopExpenses.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        contentView.addSubview(labelTopExpenses)
        contentView.addSubview(stackViewTopExpenses)
        contentView.addSubview(buttonShowMoreTopExpenses)
        contentView.addSubview(labelDateTopExpenses)
        
        
        NSLayoutConstraint.activate([
            labelTopExpenses.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelTopExpenses.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            labelDateTopExpenses.topAnchor.constraint(equalTo: labelTopExpenses.bottomAnchor, constant: 10),
            labelDateTopExpenses.leadingAnchor.constraint(equalTo: labelTopExpenses.leadingAnchor),
            
            stackViewTopExpenses.topAnchor.constraint(equalTo: labelDateTopExpenses.bottomAnchor, constant: 10),
            stackViewTopExpenses.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackViewTopExpenses.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            buttonShowMoreTopExpenses.topAnchor.constraint(equalTo: stackViewTopExpenses.bottomAnchor, constant: 5),
            buttonShowMoreTopExpenses.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            buttonShowMoreTopExpenses.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func buttonShowMoreTopExpensesParameters(){
        buttonShowMoreTopExpenses.setAttributedTitle(stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
    }
    
    private func viewToStackViewCashFLow(stackView: inout UIStackView, maxAmount: Double, totalAmount: Double, title: String, color: UIColor){
        let viewMain = UIView()
        let labelTitle: UILabel = {
            let label = UILabel()
            label.attributedText = stringToNSAttributedString(string: title, size: 15, weight: .bold, color: .black)
            return label
        }()
        
        let labelAmount: UILabel = {
            let label = UILabel()
            label.attributedText = stringToNSAttributedString(string: "\(totalAmount) zł", size: 15, weight: .bold, color: .black)
            return label
        }()
        
        let viewBackground = UIView()
        viewBackground.backgroundColor = .systemGray5
        viewBackground.layer.cornerRadius = 5
        
        let viewLine = UIView()
        viewLine.backgroundColor = color
        viewLine.layer.cornerRadius = 5
        
        viewMain.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        viewLine.translatesAutoresizingMaskIntoConstraints = false
        
        viewBackground.addSubview(viewLine)
        viewMain.addSubview(labelTitle)
        viewMain.addSubview(labelAmount)
        viewMain.addSubview(viewBackground)
        stackView.addArrangedSubview(viewMain)
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 5),
            labelTitle.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 5),
            
            labelAmount.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 5),
            labelAmount.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -5),
            
            viewBackground.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 5),
            viewBackground.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 5),
            viewBackground.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -5),
            viewBackground.bottomAnchor.constraint(equalTo: viewMain.bottomAnchor, constant: -5),
            viewBackground.heightAnchor.constraint(equalToConstant: 20),
            
            viewLine.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            viewLine.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            viewLine.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor),
            viewLine.widthAnchor.constraint(equalTo: viewBackground.widthAnchor, multiplier: totalAmount/maxAmount)
            
        ])
        
    }
    
}
