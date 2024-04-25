//
//  CashFlowCollectionViewCell.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 25/04/2024.
//

import UIKit

class CashFlowCollectionViewCell: UICollectionViewCell {
    
    let labelCashFlow = UILabel()
    var stackViewCashFlow = UIStackView()
    let labelDateCashFlow = UILabel()
    let labelAmountCashFlow = UILabel()
    let buttonShowMoreCashFlow = UIButton()
    
    static let id = "CashFlowCollectionViewCell"
    
    var data: [CellItem] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = frame.size.width / 7
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4
        
        layoutCashFlow()
        viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: 100, totalAmount: 0, title: "Доход", color: .systemGreen)
        viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: 100, totalAmount: 100, title: "Расход", color: .systemRed)
        buttonShowMoreCashFlowParameters()
        stackViewCashFlow.axis = .vertical
        stackViewCashFlow.distribution = .fillProportionally
        stackViewCashFlow.spacing = 5
        
        labelCashFlow.attributedText = stringToNSAttributedString(string: "Денежный поток", size: 26, weight: .bold, color: .black)
        labelDateCashFlow.attributedText = stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
        )
        labelAmountCashFlow.attributedText = stringToNSAttributedString(string: "-20.00 zł", size: 35, weight: .bold, color: .black)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutCashFlow(){
        labelCashFlow.translatesAutoresizingMaskIntoConstraints = false
        stackViewCashFlow.translatesAutoresizingMaskIntoConstraints = false
        buttonShowMoreCashFlow.translatesAutoresizingMaskIntoConstraints = false
        labelDateCashFlow.translatesAutoresizingMaskIntoConstraints = false
        labelAmountCashFlow.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(labelCashFlow)
        contentView.addSubview(stackViewCashFlow)
        contentView.addSubview(buttonShowMoreCashFlow)
        contentView.addSubview(labelDateCashFlow)
        contentView.addSubview(labelAmountCashFlow)
        
        NSLayoutConstraint.activate([
            labelCashFlow.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labelCashFlow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            labelDateCashFlow.topAnchor.constraint(equalTo: labelCashFlow.bottomAnchor, constant: 10),
            labelDateCashFlow.leadingAnchor.constraint(equalTo: labelCashFlow.leadingAnchor),
            
            labelAmountCashFlow.topAnchor.constraint(equalTo: labelDateCashFlow.bottomAnchor, constant: 5),
            labelAmountCashFlow.leadingAnchor.constraint(equalTo: labelDateCashFlow.leadingAnchor),
            
            stackViewCashFlow.topAnchor.constraint(equalTo: labelAmountCashFlow.bottomAnchor, constant: 10),
            stackViewCashFlow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackViewCashFlow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buttonShowMoreCashFlow.topAnchor.constraint(equalTo: stackViewCashFlow.bottomAnchor, constant: 5),
            buttonShowMoreCashFlow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            //            buttonShowMoreCashFlow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func buttonShowMoreCashFlowParameters(){
        buttonShowMoreCashFlow.setAttributedTitle(stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
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
