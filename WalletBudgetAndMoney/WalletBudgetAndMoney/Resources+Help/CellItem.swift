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

struct AccountItem: Hashable {
    var id: String?
    var image: UIImage?
    var name: String?
    var amount: Double?
    var currency: String?
    var transactions: [Transaction]?
}

struct Transaction: Hashable {
    var id: String
//    var account: AccountItem
    var name: String
    var type: Types
//    var subType: SubTypes
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

enum Category: Hashable {
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
