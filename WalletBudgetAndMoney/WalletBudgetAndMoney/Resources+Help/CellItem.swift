//
//  CellItem.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 19/04/2024.
//

import UIKit

struct CellItem: Hashable {
    var account: AccountItem?
    var data: DataItem?
}

struct AccountItem: Codable, Hashable {
    var id: String?
    var image: Data?
    var name: String?
    var amount: Double?
    var currency: String?
    var transactions: [Transaction]?
}

struct Transaction: Codable, Hashable {
    var id: String
    var nameOfAccount: String
    var name: String
    var type: Types
    var category: Category
    var date: Date
    var amount: Double
    var restAmount: Double
}

struct DataItem: Hashable {
    var id: String?
    var transactions: [Transaction]
}

struct SettingsItem: Hashable {
    var id: String?
    var text: String?
    var image: UIImage?
    var date: Date?
}

struct CurrencyItem: Hashable {
    var id: String
    var name: String
}

struct AccountTypeItem: Hashable {
    var id: String
    var type: String
    var image: UIImage?
}

struct ExpenseItem: Hashable {
    var id: String
    var text: String
    var type: Types
    var color: UIColor
    var amount: Double
}

enum Category: String, Codable, Hashable {
    case income
    case extense
}

enum Time {
    case week
    case month
    case threeMonth
    case halfYear
    case year
}

struct StatisticsItem: Hashable {
    var id: String
    var text: String
    var amount: Double
}
