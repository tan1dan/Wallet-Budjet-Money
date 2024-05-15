//
//  UserDeafualtsManager.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 14/05/2024.
//

import Foundation

class UserDefaultsManager {
    public static let shared = UserDefaultsManager()
    private init() {}
    private let userDefualts = UserDefaults.standard
    static let key: String = "Accounts"
    
    
    func create(object: [AccountItem], key: String){
        userDefualts.setAccountItems(object, forKey: key)
    }
    
    func read(key: String) -> [AccountItem]? {
        userDefualts.accountItems(forKey: key)
    }
    
    func update<T>(object: T, key: String){
        userDefualts.setValue(object, forKey: key)
    }
    
    func delete(key: String){
        userDefualts.removeObject(forKey: key)
    }
    
    
}

extension UserDefaults {
    func setAccountItems(_ items: [AccountItem], forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            self.set(encoded, forKey: key)
        }
    }

    func accountItems(forKey key: String) -> [AccountItem]? {
        guard let data = self.data(forKey: key) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode([AccountItem].self, from: data)
    }
}
