//
//  BalanceTrendCollectionViewCell.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 26/04/2024.
//

import UIKit

class BalanceTrendCollectionViewCell: UICollectionViewCell {
    
    static let id = "BalanceTrendCollectionViewCell"
    
    let labelBalanceTrend = UILabel()
    let graph = ComplexeGraphViewController()
    
    let labelDateBalanceTrend = UILabel()
    let labelAmountBalanceTrend = UILabel()
    let buttonShowMoreBalanceTrend = UIButton()
    var buttonShowMorePressed: (() -> Void)?
    var selectedIndex: Int = 1
    var time: Time = .month
    
    var data: [Transaction] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = frame.size.width / 7
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 4
        
        layoutCashFlow()
        
        labelBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Денежный поток", size: 26, weight: .bold, color: .black)
        labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
        )
        
        data = []
        for account in Model.shared.accounts {
            data += account.transactions ?? []
        }
        
        switch time {
        case .week:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущая неделя", size: 17, weight: .regular, color: .gray
            )
        case .month:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
            )
        case .threeMonth:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущие 3 месяца", size: 17, weight: .regular, color: .gray
            )
        case .halfYear:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущие полгода", size: 17, weight: .regular, color: .gray
            )
        case .year:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущий год", size: 17, weight: .regular, color: .gray
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
        
        var amount: Double = 0
        if incomeAmount >= expenseAmount {
            amount = incomeAmount - expenseAmount
        } else {
            amount = expenseAmount - incomeAmount
        }
        
        let amountRounding = Double(round(100 * amount) / 100)
        labelAmountBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "\(amountRounding) zł", size: 35, weight: .bold, color: .black)
        buttonShowMoreBalanceTrendParameters()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutCashFlow(){
        let graphView = graph.view ?? UIView()
        labelBalanceTrend.translatesAutoresizingMaskIntoConstraints = false
        buttonShowMoreBalanceTrend.translatesAutoresizingMaskIntoConstraints = false
        labelDateBalanceTrend.translatesAutoresizingMaskIntoConstraints = false
        labelAmountBalanceTrend.translatesAutoresizingMaskIntoConstraints = false
        graphView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelBalanceTrend)
        contentView.addSubview(buttonShowMoreBalanceTrend)
        contentView.addSubview(labelDateBalanceTrend)
        contentView.addSubview(labelAmountBalanceTrend)
        contentView.addSubview(graphView)
        
        NSLayoutConstraint.activate([
            labelBalanceTrend.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelBalanceTrend.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            
            labelDateBalanceTrend.topAnchor.constraint(equalTo: labelBalanceTrend.bottomAnchor, constant: 10),
            labelDateBalanceTrend.leadingAnchor.constraint(equalTo: labelBalanceTrend.leadingAnchor),
            
            
            labelAmountBalanceTrend.topAnchor.constraint(equalTo: labelDateBalanceTrend.bottomAnchor, constant: 5),
            labelAmountBalanceTrend.leadingAnchor.constraint(equalTo: labelDateBalanceTrend.leadingAnchor),
            
            graphView.topAnchor.constraint(equalTo: labelAmountBalanceTrend.bottomAnchor, constant: 10),
            graphView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            graphView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            graphView.heightAnchor.constraint(equalToConstant: 250),
            
            buttonShowMoreBalanceTrend.topAnchor.constraint(equalTo: graphView.bottomAnchor, constant: 5),
            buttonShowMoreBalanceTrend.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            buttonShowMoreBalanceTrend.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func buttonShowMoreBalanceTrendParameters(){
        buttonShowMoreBalanceTrend.setAttributedTitle(UIView.stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
        buttonShowMoreBalanceTrend.addTarget(nil, action: #selector(buttonShowMoreAction), for: .touchUpInside)
    }
    
    @objc private func buttonShowMoreAction(){
        buttonShowMorePressed?()
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
        graph.model.time = time
        updateData()
        graph.model.updateData()
    }
    
    private func updateData(){
        data = []
        for account in Model.shared.accounts {
            data += account.transactions ?? []
        }
        
        switch time {
        case .week:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущая неделя", size: 17, weight: .regular, color: .gray
            )
        case .month:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
            )
        case .threeMonth:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущие 3 месяца", size: 17, weight: .regular, color: .gray
            )
        case .halfYear:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущие полгода", size: 17, weight: .regular, color: .gray
            )
        case .year:
            data = data.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
            labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущий год", size: 17, weight: .regular, color: .gray
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
        
        var amount: Double = 0
        if incomeAmount >= expenseAmount {
            amount = incomeAmount - expenseAmount
        } else {
            amount = expenseAmount - incomeAmount
        }
        let amountRounding = Double(round(100 * amount) / 100)
        labelAmountBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "\(amountRounding) zł", size: 35, weight: .bold, color: .black)
    }
}
