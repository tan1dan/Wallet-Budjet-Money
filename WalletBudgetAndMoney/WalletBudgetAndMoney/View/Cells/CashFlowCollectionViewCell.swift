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
    
    var buttonShowMorePressed: (() -> Void)?
    var data: [CellItem] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = frame.size.width / 7
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 4
        
        layoutCashFlow()
        viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: 1000, totalAmount: 1000, title: "Доход", color: .systemGreen)
        viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: 1000, totalAmount: 300, title: "Расход", color: .systemRed)
        buttonShowMoreCashFlowParameters()
        stackViewCashFlow.axis = .vertical
        stackViewCashFlow.distribution = .equalSpacing
        stackViewCashFlow.spacing = 5
        
        labelCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Денежный поток", size: 26, weight: .bold, color: .black)
        labelDateCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
        )
        labelAmountCashFlow.attributedText = UIView.stringToNSAttributedString(string: "700 zł", size: 35, weight: .bold, color: .black)
        
        
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
            labelCashFlow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelCashFlow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            labelDateCashFlow.topAnchor.constraint(equalTo: labelCashFlow.bottomAnchor, constant: 10),
            labelDateCashFlow.leadingAnchor.constraint(equalTo: labelCashFlow.leadingAnchor),
            
            labelAmountCashFlow.topAnchor.constraint(equalTo: labelDateCashFlow.bottomAnchor, constant: 5),
            labelAmountCashFlow.leadingAnchor.constraint(equalTo: labelDateCashFlow.leadingAnchor),
            
            stackViewCashFlow.topAnchor.constraint(equalTo: labelAmountCashFlow.bottomAnchor, constant: 10),
            stackViewCashFlow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackViewCashFlow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            buttonShowMoreCashFlow.topAnchor.constraint(equalTo: stackViewCashFlow.bottomAnchor, constant: 5),
            buttonShowMoreCashFlow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            buttonShowMoreCashFlow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func buttonShowMoreCashFlowParameters(){
        buttonShowMoreCashFlow.setAttributedTitle(UIView.stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
        buttonShowMoreCashFlow.addTarget(nil, action: #selector(buttonShowMoreAction), for: .touchUpInside)
    }
    
    @objc private func buttonShowMoreAction(){
        buttonShowMorePressed?()
    }
    
    private func viewToStackViewCashFLow(stackView: inout UIStackView, maxAmount: Double, totalAmount: Double, title: String, color: UIColor){
        let viewMain = UIView()
        let labelTitle: UILabel = {
            let label = UILabel()
            label.attributedText = UIView.stringToNSAttributedString(string: title, size: 15, weight: .bold, color: .black)
            return label
        }()
        
        let labelAmount: UILabel = {
            let label = UILabel()
            label.attributedText = UIView.stringToNSAttributedString(string: "\(totalAmount) zł", size: 15, weight: .bold, color: .black)
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
