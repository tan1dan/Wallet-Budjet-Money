//
//  TopExpensesViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 26/04/2024.
//

import UIKit

class  TopExpensesViewController: UIViewController, UICollectionViewDelegate {
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCompositionalLayout())
    
    var items: [CellItem] = [CellItem(data: DataItem(id: UUID().uuidString))]
    
    var dataSource: UICollectionViewDiffableDataSource<Section, CellItem>!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionViewParameters()
        layoutVC()
        nvParameters()
        collectionView.register(TopExpensesCollectionViewCell.self, forCellWithReuseIdentifier: TopExpensesCollectionViewCell.id)
        
        collectionView.delegate = self
        let topExpensesCellRegistration = UICollectionView.CellRegistration<TopExpensesCollectionViewCell, CellItem> {
            cell, indexPath, itemIdentifier in
            
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: CellItem) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: topExpensesCellRegistration, for: indexPath, item: itemIdentifier)
            cell.buttonShowMoreTopExpenses.isHidden = true
            return cell
            
        }
        
        var firstSnapshot = NSDiffableDataSourceSnapshot<Section, CellItem>()
        firstSnapshot.appendSections([.first])
        firstSnapshot.appendItems(items, toSection: .first)
        dataSource.apply(firstSnapshot, animatingDifferences: true)
    }
    
    func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, environment) ->
            NSCollectionLayoutSection? in
            
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
    
    private func collectionViewParameters(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
    }
    
    private func layoutVC(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func nvParameters(){
        navigationItem.title = "Баланс"
    }
}
