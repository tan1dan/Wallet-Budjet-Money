//
//  MainVCModel.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 03/05/2024.
//

import UIKit

class Model {
    static let shared = Model()
    var accounts: [AccountItem] = [AccountItem(id: UUID().uuidString, image: UIImage(resource: .income), name: "Santander", amount: Double("1000.00") ?? (0), currency: "PLN", transactions: [Transaction(id: UUID().uuidString, name: "Начальные деньги", type: .income, category: .income, date: Date(), amount: Double("1000.00") ?? 0, restAmount: 1000.00)])]
}

