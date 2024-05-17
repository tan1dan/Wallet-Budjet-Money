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
    
    var data: [Transaction] = []
    var buttonShowMorePressed: (() -> Void)?
    var expenseItems: [ExpenseItem] = []
    var time: Time = .month
    var isAllExpenses = false
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
        updateLayoutTopExpenses()
        buttonShowMoreTopExpensesParameters()
        stackViewTopExpenses.axis = .vertical
        stackViewTopExpenses.distribution = .fillProportionally
        stackViewTopExpenses.spacing = 5
        
        labelTopExpenses.attributedText = UIView.stringToNSAttributedString(string: "Топ расходов", size: 26, weight: .bold, color: .black)
        labelDateTopExpenses.attributedText = UIView.stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayoutTopExpenses()
    }
    
    private func updateLayoutTopExpenses(){
        
        labelTopExpenses.removeFromSuperview()
        stackViewTopExpenses.subviews.forEach({$0.removeFromSuperview()})
        stackViewTopExpenses.removeFromSuperview()
        buttonShowMoreTopExpenses.removeFromSuperview()
        labelDateTopExpenses.removeFromSuperview()
        
        NSLayoutConstraint.deactivate([
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
        
        expenseItems = []
        
        let accounts = Model.shared.accounts
        var transactions: [Transaction] = []
        for account in accounts {
            transactions += account.transactions ?? []
        }
        
        switch time {
        case .week:
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
                .filter({$0.category == .extense})
            data = filteredTransactions
        case .month:
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
                .filter({$0.category == .extense})
            data = filteredTransactions
        case .threeMonth:
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
                .filter({$0.category == .extense})
            data = filteredTransactions
        case .halfYear:
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
                .filter({$0.category == .extense})
            data = filteredTransactions
        case .year:
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
                .filter({$0.category == .extense})
            data = filteredTransactions
        }
        
        var foodAndDrinksTransactions: [Transaction] = []
        var foodAndDrinksAmount: Double = 0
        var buysTransactions: [Transaction] = []
        var buysAmount: Double = 0
        var houseTransactions: [Transaction] = []
        var houseAmount: Double = 0
        var transportTransactions: [Transaction] = []
        var transportAmount: Double = 0
        var carTransactions: [Transaction] = []
        var carAmount: Double = 0
        var relaxTransactions: [Transaction] = []
        var relaxAmount: Double = 0
        var communicationTransactions: [Transaction] = []
        var communicationAmount: Double = 0
        var financeTransactions: [Transaction] = []
        var financeAmount: Double = 0
        var investTransactions: [Transaction] = []
        var investAmount: Double = 0
        
        for transaction in data {
            switch transaction.type {
            case .foodAndDrinks:
                foodAndDrinksTransactions.append(transaction)
            case .buys:
                buysTransactions.append(transaction)
            case .house:
                houseTransactions.append(transaction)
            case .transport:
                transportTransactions.append(transaction)
            case .car:
                carTransactions.append(transaction)
            case .relax:
                relaxTransactions.append(transaction)
            case .communication:
                communicationTransactions.append(transaction)
            case .finance:
                financeTransactions.append(transaction)
            case .invest:
                investTransactions.append(transaction)
            case .income:
                return
            }
        }
        
        for transaction in foodAndDrinksTransactions {
            foodAndDrinksAmount += transaction.amount
        }
        
        for transaction in buysTransactions {
            buysAmount += transaction.amount
        }
        
        for transaction in houseTransactions {
            houseAmount += transaction.amount
        }
        
        for transaction in transportTransactions {
            transportAmount += transaction.amount
        }
        
        for transaction in carTransactions {
            carAmount += transaction.amount
        }
        
        for transaction in relaxTransactions {
            relaxAmount += transaction.amount
        }
        
        for transaction in communicationTransactions {
            communicationAmount += transaction.amount
        }
        
        for transaction in financeTransactions {
            financeAmount += transaction.amount
        }
        
        for transaction in investTransactions {
            investAmount += transaction.amount
        }
        
        expenseItems.append(ExpenseItem(id: UUID().uuidString, text: FoodAndDrinks.food, type: .foodAndDrinks, color: .systemRed, amount: foodAndDrinksAmount))
        
        expenseItems.append(ExpenseItem(id: UUID().uuidString, text: Buys.buys, type: .buys, color: .systemBlue, amount: buysAmount))
        
        expenseItems.append(ExpenseItem(id: UUID().uuidString, text: House.house, type: .house, color: .systemOrange, amount: houseAmount))
        
        expenseItems.append(ExpenseItem(id: UUID().uuidString, text: Transport.transport, type: .transport, color: .systemGray, amount: transportAmount))
        
        expenseItems.append(ExpenseItem(id: UUID().uuidString, text: Car.car, type: .car, color: .systemPurple, amount: carAmount))
        
        expenseItems.append(ExpenseItem(id: UUID().uuidString, text: Relax.relax, type: .relax, color: .systemGreen, amount: relaxAmount))
        
        expenseItems.append(ExpenseItem(id: UUID().uuidString, text: Communication.communcitaion, type: .communication, color: .blue, amount: communicationAmount))
        
        expenseItems.append(ExpenseItem(id: UUID().uuidString, text: Finance.finance, type: .finance, color: .green, amount: financeAmount))
        
        expenseItems.append(ExpenseItem(id: UUID().uuidString, text: Invest.invest, type: .invest, color: .systemPink, amount: investAmount))
        
        expenseItems.sort(by: {$0.amount > $1.amount})
        
        if isAllExpenses {
            for expenseItem in expenseItems {
                viewToStackViewTopExpenses(stackView: &stackViewTopExpenses, maxAmount: expenseItems.first?.amount ?? 0, totalAmount: expenseItem.amount, title: expenseItem.text, color: expenseItem.color)
            }
        } else {
            for i in 0...2 {
                viewToStackViewTopExpenses(stackView: &stackViewTopExpenses, maxAmount: expenseItems.first?.amount ?? 0, totalAmount: expenseItems[i].amount, title: expenseItems[i].text, color: expenseItems[i].color)
            }
        }
        
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
        buttonShowMoreTopExpenses.setAttributedTitle(UIView.stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
        buttonShowMoreTopExpenses.addTarget(nil, action: #selector(buttonShowMoreAction), for: .touchUpInside)
    }
    
    @objc private func buttonShowMoreAction(){
        buttonShowMorePressed?()
    }
    
    private func viewToStackViewTopExpenses(stackView: inout UIStackView, maxAmount: Double, totalAmount: Double, title: String, color: UIColor){
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
