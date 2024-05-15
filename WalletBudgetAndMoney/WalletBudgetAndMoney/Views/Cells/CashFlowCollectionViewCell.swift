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
    var data: [Transaction] = []
    var selectedIndex = 1
    var time: Time = .month
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = frame.size.width / 7
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 4
        for account in Model.shared.accounts {
            data += account.transactions ?? []
        }
        var incomeAmount: Double = 0
        var expenseAmount: Double = 0
        let incomes = data.filter({ $0.category == .income })
        let expenses = data.filter({$0.category == .extense})
        
        for item in incomes {
            incomeAmount += item.amount
        }
        
        for item in expenses {
            expenseAmount += item.amount
        }
        
        var maxAmount: Double = 0
        var amount: Double = 0
        if incomeAmount >= expenseAmount {
            maxAmount = incomeAmount
            amount = incomeAmount - expenseAmount
            viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: maxAmount, totalAmount: maxAmount, title: "Доход", color: .systemGreen)
            viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: maxAmount, totalAmount: expenseAmount , title: "Расход", color: .systemRed)
        } else {
            maxAmount = expenseAmount
            amount = expenseAmount - incomeAmount
            viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: maxAmount, totalAmount: maxAmount, title: "Доход", color: .systemGreen)
            viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: maxAmount, totalAmount: incomeAmount , title: "Расход", color: .systemRed)
        }
        
        layoutCashFlow()
        
        buttonShowMoreCashFlowParameters()
        stackViewCashFlow.axis = .vertical
        stackViewCashFlow.distribution = .equalSpacing
        stackViewCashFlow.spacing = 5
        
        labelCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Денежный поток", size: 26, weight: .bold, color: .black)
        labelDateCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
        )
        let amountRounding = Double(round(100 * amount) / 100)
        labelAmountCashFlow.attributedText = UIView.stringToNSAttributedString(string: "\(amountRounding) zł", size: 35, weight: .bold, color: .black)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if selectedIndex == 0 {
            time = .week
        } else if selectedIndex == 1 {
            time = .month
        } else if selectedIndex == 2 {
            time = .threeMonth
        } else if selectedIndex == 3 {
            time = .halfYear
        } else {
            time = .year
        }
        updateLayout()
    }
    
    private func updateLayout(){
        stackViewCashFlow.subviews.forEach({$0.removeFromSuperview()})
        stackViewCashFlow.removeFromSuperview()
        labelCashFlow.removeFromSuperview()
        buttonShowMoreCashFlow.removeFromSuperview()
        labelDateCashFlow.removeFromSuperview()
        labelAmountCashFlow.removeFromSuperview()
        
        NSLayoutConstraint.deactivate([
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
        data = []
        for account in Model.shared.accounts {
            data += account.transactions ?? []
        }
        
        switch time {
        case .week:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
            labelDateCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Текущая неделя", size: 17, weight: .regular, color: .gray
            )
        case .month:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
            labelDateCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
            )
        case .threeMonth:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
            labelDateCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Текущие 3 месяца", size: 17, weight: .regular, color: .gray
            )
        case .halfYear:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
            labelDateCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Текущие полгода", size: 17, weight: .regular, color: .gray
            )
        case .year:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
            labelDateCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Текущий год", size: 17, weight: .regular, color: .gray
            )
        }
        
        
        var incomeAmount: Double = 0
        var expenseAmount: Double = 0
        let incomes = data.filter({ $0.category == .income })
        let expenses = data.filter({$0.category == .extense})
        
        for item in incomes {
            incomeAmount += item.amount
        }
        
        for item in expenses {
            expenseAmount += item.amount
        }
        
        var maxAmount: Double = 0
        var amount: Double = 0
        if incomeAmount >= expenseAmount {
            maxAmount = incomeAmount
            amount = incomeAmount - expenseAmount
            viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: maxAmount, totalAmount: maxAmount, title: "Доход", color: .systemGreen)
            viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: maxAmount, totalAmount: expenseAmount , title: "Расход", color: .systemRed)
        } else {
            maxAmount = expenseAmount
            amount = expenseAmount - incomeAmount
            viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: maxAmount, totalAmount: maxAmount, title: "Доход", color: .systemGreen)
            viewToStackViewCashFLow(stackView: &stackViewCashFlow, maxAmount: maxAmount, totalAmount: incomeAmount, title: "Расход", color: .systemRed)
        }
        
        layoutCashFlow()
        
        buttonShowMoreCashFlowParameters()
        stackViewCashFlow.axis = .vertical
        stackViewCashFlow.distribution = .equalSpacing
        stackViewCashFlow.spacing = 5
        
        labelCashFlow.attributedText = UIView.stringToNSAttributedString(string: "Денежный поток", size: 26, weight: .bold, color: .black)
        let amountRounding = Double(round(100 * amount) / 100)
        labelAmountCashFlow.attributedText = UIView.stringToNSAttributedString(string: "\(amountRounding) zł", size: 35, weight: .bold, color: .black)
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
        var kf: Double = 0
        let labelTitle: UILabel = {
            let label = UILabel()
            label.attributedText = UIView.stringToNSAttributedString(string: title, size: 15, weight: .bold, color: .black)
            return label
        }()
        
        let labelAmount: UILabel = {
            let label = UILabel()
            let totalAmountRounding = Double(round(100 * totalAmount) / 100)
            label.attributedText = UIView.stringToNSAttributedString(string: "\(totalAmountRounding) zł", size: 15, weight: .bold, color: .black)
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
        
        if maxAmount == 0 {
            kf = 0
        } else {
            kf = totalAmount/maxAmount
        }
        
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
            viewLine.widthAnchor.constraint(equalTo: viewBackground.widthAnchor, multiplier: kf)
            
        ])
        
    }
    
}
