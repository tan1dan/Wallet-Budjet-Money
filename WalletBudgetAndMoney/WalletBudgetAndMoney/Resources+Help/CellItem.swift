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
    var account: AccountItem
    var name: String
    var type: Types
    var subType: SubTypes
    var category: String
    var date: Date
    var amount: Double
}

struct DataItem: Hashable {
    var id: String?
}
