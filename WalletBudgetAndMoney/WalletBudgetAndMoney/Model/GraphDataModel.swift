
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
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
                
            }
        case .month:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
            }
            
        case .threeMonth:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
            }
            
        case .halfYear:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
            }
            reports.reverse()
        case .year:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
            }
            reports.reverse()
        }
    }
    
    func updateData(){
        reports = []
        switch time {
        case .week:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
    
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
            }
            
        case .month:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
            }
        case .threeMonth:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
            }
            
        case .halfYear:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
            }
        case .year:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            var filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
            var index = 0
            filteredTransactions.reverse()
            for transaction in filteredTransactions {
                let amountRounding = Double(round(100 * transaction.restAmount) / 100)
                reports.append(DailyReport(index: index, date: transaction.date, amount: CGFloat(amountRounding)))
                index += 1
            }
        }
    }
    
    public func report(for index: Int) -> DailyReport? {
        return reports.first(where: { $0.index == index })
    }
    
}
