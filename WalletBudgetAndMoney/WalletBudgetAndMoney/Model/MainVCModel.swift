//
//  MainVCModel.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 03/05/2024.
//

import UIKit

class Model {
    
    static let shared = Model()
    var accounts: [AccountItem] = []
    
    private init() {
        accounts = UserDefaultsManager.shared.read(key: UserDefaultsManager.key) ?? []
    }
}

