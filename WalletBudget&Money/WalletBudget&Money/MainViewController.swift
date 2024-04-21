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
    
    var accountItems: [CellItem] = [CellItem(account: AccountItem()), CellItem(), CellItem(account: AccountItem(id: UUID().uuidString)), CellItem(account: AccountItem(id: UUID().uuidString)), CellItem(account: AccountItem(id: UUID().uuidString))]
    var dataItems: [CellItem] = [CellItem(data: DataItem()), CellItem(data: DataItem(id: UUID().uuidString)), CellItem(data: DataItem(id: UUID().uuidString))]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionViewParameters()
        layout()
        
        
        collectionView.register(AccountsCollectionViewCell.self, forCellWithReuseIdentifier: AccountsCollectionViewCell.id)
        collectionView.register(DataCollectionViewCell.self, forCellWithReuseIdentifier: DataCollectionViewCell.id)
        
        
        collectionView.delegate = self
        
        let firstCellRegistration = UICollectionView.CellRegistration<AccountsCollectionViewCell, CellItem> {
            cell, indexPath, itemIdentifier in
            
            
        }
        
        let secondCellRegistration = UICollectionView.CellRegistration<DataCollectionViewCell, CellItem> {
            cell, IndexPath, itemIdentifier in
            
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: CellItem) -> UICollectionViewCell? in
            if indexPath.section == 0 {
                let cell = collectionView.dequeueConfiguredReusableCell(using: firstCellRegistration, for: indexPath, item: itemIdentifier)
                return cell
            } else {
                let cell = collectionView.dequeueConfiguredReusableCell(using: secondCellRegistration, for: indexPath, item: itemIdentifier)
                return cell
            }
        }
        
        var firstSnapshot = NSDiffableDataSourceSnapshot<Section, CellItem>()
        firstSnapshot.appendSections([.first, .second])
        firstSnapshot.appendItems(accountItems, toSection: .first)
        firstSnapshot.appendItems(dataItems, toSection: .second)
        dataSource.apply(firstSnapshot, animatingDifferences: true)
        
    }
    
    func layout(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
//                group.interItemSpacing = .fixed(25)
//                group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(20), top: .fixed(0), trailing: .fixed(25), bottom: .fixed(0))
                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.interGroupSpacing = 20
                layoutSection.contentInsets = .init(top: 15, leading: 20, bottom: 0, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                return layoutSection
                
            } else {
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.size.width - 40), heightDimension: .fractionalWidth(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.size.width - 40), heightDimension: .fractionalWidth(1))

                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
//                group.edgeSpacing = .init(leading: .fixed(20), top: .fixed(20), trailing: .fixed(20), bottom: .fixed(0))
                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.interGroupSpacing = 20
                layoutSection.contentInsets = .init(top: 20, leading: 20, bottom: 0, trailing: 20)
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

extension MainViewController: UICollectionViewDelegate {
    
}
