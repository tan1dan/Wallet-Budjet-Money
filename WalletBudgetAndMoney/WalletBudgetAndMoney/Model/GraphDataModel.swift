//
//  DataModel.swift
//  SwiftGraphKit_Example
//
//  Created by Charles Bessonnet on 25/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

struct DailyReport {
    var index: Int
    var date: Date
    var amount: CGFloat
}

class GraphDataModel {

    var reports = [DailyReport]()
    
    var dataFrame: CGRect {
        return CGRect(x: 0, y: 0, width: 20, height: 7000)
    }
    
    var time: Time = .month
    init() {
        
        switch time {
        case .week:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count {
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
                
            }
        case .month:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count - 1{
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
            }
            
        case .threeMonth:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count {
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
            }
            
        case .halfYear:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count {
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
            }
            reports.reverse()
        case .year:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count {
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
            }
            reports.reverse()
        }
        
//        let date = Date()
//        let max  = Int(dataFrame.width)
//        
//        let minAmount = Float(dataFrame.minY)
//        let maxAmount = Float(dataFrame.maxY)
//        
//        for i in 0..<max {
//            let amount = CGFloat(Float.random(in: minAmount..<maxAmount))
//            let day: TimeInterval = 24 * 60 * 60
//            let currentDate = date.addingTimeInterval(TimeInterval(i - max) * day)
//            let report = DailyReport(index: i, date: currentDate, amount: amount)
//            
//            reports.append(report)
//        }
        
    }
    
    func updateData(){
        switch time {
        case .week:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count {
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
            }
            
        case .month:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count - 1{
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
            }
        case .threeMonth:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count {
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
            }
            
        case .halfYear:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count {
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
            }
        case .year:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for i in 0...accounts.count {
                transactions += accounts[i].transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(transaction.restAmount)))
                index += 1
            }
        }
    }
    
    public func report(for index: Int) -> DailyReport? {
        return reports.first(where: { $0.index == index })
    }
    
}
