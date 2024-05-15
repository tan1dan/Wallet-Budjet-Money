//
//  ViewController.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 18/04/2024.
//

import UIKit

enum Section {
    case first
    case second
}

class MainViewController: UIViewController {
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCompositionalLayout())
    let imageView = UIImageView(image: UIImage(resource: .cvBack2))
    var dataSource: UICollectionViewDiffableDataSource<Section, CellItem>!
    var accountItems: [CellItem] = []
    var dataItems: [CellItem] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCollectionViewData()
    }
    
    private func updateCollectionViewData(){
        accountItems = updateAccountItems()
        dataItems = updateDataItems()
        var snapshot = dataSource.snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([.first, .second])
        snapshot.appendItems(accountItems, toSection: .first)
        snapshot.appendItems(dataItems, toSection: .second)
        dataSource.apply(snapshot, animatingDifferences: true)
        collectionView.reloadData()
        collectionView.reloadInputViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionViewParameters()
        layoutVC()
        accountItems = updateAccountItems()
        dataItems = updateDataItems()
        collectionView.register(AccountsCollectionViewCell.self, forCellWithReuseIdentifier: AccountsCollectionViewCell.id)
        collectionView.register(AccountsAddCollectionViewCell.self, forCellWithReuseIdentifier: AccountsAddCollectionViewCell.id)
        
        collectionView.register(LastRecordsCollectionViewCell.self, forCellWithReuseIdentifier: LastRecordsCollectionViewCell.id)
        collectionView.register(CashFlowCollectionViewCell.self, forCellWithReuseIdentifier: CashFlowCollectionViewCell.id)
        collectionView.register(TopExpensesCollectionViewCell.self, forCellWithReuseIdentifier: TopExpensesCollectionViewCell.id)
        
        
        
        let accountsCellRegistration = UICollectionView.CellRegistration<AccountsCollectionViewCell, CellItem> {
            cell, indexPath, itemIdentifier in
            cell.labelAccountType.attributedText = UIView.stringToNSAttributedString(string: itemIdentifier.account?.name ?? "", size: 20, weight: .regular, color: .gray)
            
            let amountRounding = Double(round(100 * (itemIdentifier.account?.amount ?? 0)) / 100)
            
            cell.labelAmount.attributedText = UIView.stringToNSAttributedString(string: String(amountRounding), size: 24, weight: .bold, color: .black)
            cell.labelCurrency.attributedText = UIView.stringToNSAttributedString(string: itemIdentifier.account?.currency ?? "", size: 22, weight: .light, color: .black)
        }
        
        let accountsAddCellRegistration = UICollectionView.CellRegistration<AccountsAddCollectionViewCell, CellItem> {
            cell, IndexPath, itemIdentifier in
            cell.logoViewAddCellPressed = { [weak self] in
                let vc = SettingsAccountViewController()
                self?.tabBarController?.navigationController?.pushViewController(vc, animated: true)
                self?.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: false)
            }
        }
        
        let lastRecordsCellRegistration = UICollectionView.CellRegistration<LastRecordsCollectionViewCell, CellItem> {
            cell, IndexPath, itemIdentifier in
            var transactions: [Transaction] = []
            if itemIdentifier.data?.transactions.count ?? 0 >= 3 {
                for i in 0...2 {
                    transactions.append((itemIdentifier.data?.transactions[i])!)
                }
            } else {
                for i in 0...(itemIdentifier.data?.transactions.count ?? 0) - 1 {
                    transactions.append((itemIdentifier.data?.transactions[i])!)
                }
            }
            cell.data = transactions.reversed()
            
            cell.buttonShowMorePressed = { [weak self] in
                let vc = LastRecordsViewController()
                self?.tabBarController?.navigationController?.pushViewController(vc, animated: true)
                self?.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: false)
            }
        }
        
        let cashFlowCellRegistration = UICollectionView.CellRegistration<CashFlowCollectionViewCell, CellItem> {
            cell, IndexPath, itemIdentifier in
            
            cell.buttonShowMorePressed = { [weak self] in
                let vc = CashFlowViewController()
                self?.tabBarController?.navigationController?.pushViewController(vc, animated: true)
                self?.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: false)
            }
        }
        
        let topExpensesCellRegistration = UICollectionView.CellRegistration<TopExpensesCollectionViewCell, CellItem> {
            cell, IndexPath, itemIdentifier in
            
            cell.buttonShowMorePressed = { [weak self] in
                let vc = TopExpensesViewController()
                self?.tabBarController?.navigationController?.pushViewController(vc, animated: true)
                self?.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: false)
            }
        }
        
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: CellItem) -> UICollectionViewCell? in
            if indexPath.section == 0 {
                if indexPath.row == self.accountItems.count - 1 {
                    let cell = collectionView.dequeueConfiguredReusableCell(using: accountsAddCellRegistration, for: indexPath, item: itemIdentifier)
                    return cell
                } else {
                    let cell = collectionView.dequeueConfiguredReusableCell(using: accountsCellRegistration, for: indexPath, item: itemIdentifier)
                    return cell
                }
            } else {
                if indexPath.row == 0 {
                    let cell = collectionView.dequeueConfiguredReusableCell(using: lastRecordsCellRegistration, for: indexPath, item: itemIdentifier)
                    return cell
                } else if indexPath.row == 1 {
                    let cell = collectionView.dequeueConfiguredReusableCell(using: cashFlowCellRegistration, for: indexPath, item: itemIdentifier)
                    return cell
                } else {
                    let cell = collectionView.dequeueConfiguredReusableCell(using: topExpensesCellRegistration, for: indexPath, item: itemIdentifier)
                    return cell
                }

            }
            
        }
        
        var firstSnapshot = NSDiffableDataSourceSnapshot<Section, CellItem>()
        firstSnapshot.appendSections([.first, .second])
        firstSnapshot.appendItems(accountItems, toSection: .first)
        firstSnapshot.appendItems(dataItems, toSection: .second)
        dataSource.apply(firstSnapshot, animatingDifferences: true)
        
    }
    
    private func updateAccountItems() -> [CellItem]{
        var arrayItems: [CellItem] = []
        for item in Model.shared.accounts {
            arrayItems.append(CellItem(account: item))
        }
        arrayItems.append(CellItem(account: AccountItem(id: "AddCell")))
        return arrayItems
    }
    
    private func updateDataItems() -> [CellItem] {
        var transactions: [Transaction] = []
        var dataItems: [CellItem] = []
        let accounts = Model.shared.accounts
        for item in accounts {
            transactions += item.transactions!
        }
        transactions = transactions.filter({$0.date <= Date() && $0.date >= Date() - 60 * 60 * 24 * 30})
        for _ in 0...2 {
            dataItems.append(CellItem(data: DataItem(id: UUID().uuidString, transactions: transactions)))
        }
        transactions.sort(by: {$0.date > $1.date})
        return dataItems
    }
    
    private func layoutVC(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, environment) ->
            NSCollectionLayoutSection? in
            if section == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.size.width / 2 - 37.5), heightDimension: .absolute(self.view.frame.size.width / 2 - 37.5))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.size.width / 2 - 37.5), heightDimension: .absolute(self.view.frame.size.width / 2 - 37.5))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.interGroupSpacing = 20
                layoutSection.contentInsets = .init(top: 15, leading: 20, bottom: 0, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                return layoutSection
                
            } else {
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.size.width - 40), heightDimension: .estimated(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.size.width - 40), heightDimension: .estimated(1))

                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.interGroupSpacing = 20
                layoutSection.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
                return layoutSection
                
            }
        }
    }
    
    private func collectionViewParameters(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
    }
}

