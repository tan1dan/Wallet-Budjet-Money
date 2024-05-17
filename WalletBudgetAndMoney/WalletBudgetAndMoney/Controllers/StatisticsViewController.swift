//
//  StatisticsViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 30/04/2024.
//

import UIKit

class StatisticsViewController: UIViewController, UICollectionViewDelegate {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "Статистика", size: 35, weight: .bold, color: .black)
        return label
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCompositionalLayout())
    var dataSource: UICollectionViewDiffableDataSource<Section, StatisticsItem>!
    var collectionItems: [StatisticsItem] = []
    var time: Time = .month
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionViewParameters()
        layoutVC()
        collectionView.delegate = self
        updateItems()
        collectionView.register(StatisticsCollectionViewCell.self, forCellWithReuseIdentifier: StatisticsCollectionViewCell.id)
        
        let cellRegistration = UICollectionView.CellRegistration<StatisticsCollectionViewCell, StatisticsItem> {
            cell, IndexPath, itemIdentifier in
            cell.labelTitle.attributedText = UIView.stringToNSAttributedString(string: itemIdentifier.text, size: 18, weight: .bold, color: .systemGray2)
            let amountRounding = Double(round(100 * itemIdentifier.amount) / 100)
            cell.labelAmount.attributedText = UIView.stringToNSAttributedString(string: "\(amountRounding)", size: 25, weight: .bold, color: .black)
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: StatisticsItem) -> UICollectionViewCell? in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            return cell
        }
        
        var firstSnapshot = NSDiffableDataSourceSnapshot<Section, StatisticsItem>()
        firstSnapshot.appendSections([.first])
        firstSnapshot.appendItems(collectionItems, toSection: .first)
        dataSource.apply(firstSnapshot, animatingDifferences: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCollectionViewData()
    }
    
    private func updateCollectionViewData(){
        updateItems()
        var snapshot = dataSource.snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([.first])
        snapshot.appendItems(collectionItems, toSection: .first)
        dataSource.apply(snapshot, animatingDifferences: true)
        collectionView.reloadData()
    }
    
    
    private func updateItems(){
        //BalanceItem
        collectionItems.removeAll()
        let accounts = Model.shared.accounts
        var balance: Double = 0
        for account in accounts {
            balance += account.amount ?? 0
        }
        collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Баланс", amount: balance))
        
        // Expenses Item
        var expenses: Double = 0
        switch time {
        case .week:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
                .filter({$0.category == .extense})
            for transaction in filteredTransactions {
                expenses += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Расходы", amount: expenses))
        case .month:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
                .filter({$0.category == .extense})
            for transaction in filteredTransactions {
                expenses += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Расходы", amount: expenses))
        case .threeMonth:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
                .filter({$0.category == .extense})
            for transaction in filteredTransactions {
                expenses += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Расходы", amount: expenses))
        case .halfYear:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
                .filter({$0.category == .extense})
            for transaction in filteredTransactions {
                expenses += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Расходы", amount: expenses))
        case .year:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
                .filter({$0.category == .extense})
            for transaction in filteredTransactions {
                expenses += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Расходы", amount: expenses))
        }
        
        //Incomes Item
        var incomes: Double = 0
        switch time {
        case .week:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 7 })
                .filter({$0.category == .income})
            for transaction in filteredTransactions {
                incomes += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Доходы", amount: incomes))
        case .month:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30 })
                .filter({$0.category == .income})
            for transaction in filteredTransactions {
                incomes += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Доходы", amount: incomes))
        case .threeMonth:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 90 })
                .filter({$0.category == .income})
            for transaction in filteredTransactions {
                incomes += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Доходы", amount: incomes))
        case .halfYear:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 180 })
                .filter({$0.category == .income})
            for transaction in filteredTransactions {
                incomes += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Доходы", amount: incomes))
        case .year:
            let accounts = Model.shared.accounts
            var transactions: [Transaction] = []
            for account in accounts {
                transactions += account.transactions!
            }
            transactions.sort(by: {$0.date > $1.date})
            let filteredTransactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 365 })
                .filter({$0.category == .income})
            for transaction in filteredTransactions {
                incomes += transaction.amount
            }
            collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Доходы", amount: incomes))
        }
        
        //CashFlow Item
        var cashFlow: Double = 0
        
        cashFlow = incomes - expenses
        
        collectionItems.append(StatisticsItem(id: UUID().uuidString, text: "Денежный поток", amount: cashFlow))
    }
    
    private func layoutVC(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, environment) ->
            NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.size.width - 40), heightDimension: .absolute(80))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.size.width - 40), heightDimension: .absolute(80))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.interGroupSpacing = 20
                layoutSection.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 0)
                
                return layoutSection
                
        }
    }
    
    private func collectionViewParameters(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
    }
    
}
