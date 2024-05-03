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
    var dataSource: UICollectionViewDiffableDataSource<Section, CellItem>!
    var collectionItems: [CellItem] = [CellItem(data: DataItem(id: UUID().uuidString)), CellItem(data: DataItem(id: UUID().uuidString)), CellItem(data: DataItem(id: UUID().uuidString)), CellItem(data: DataItem(id: UUID().uuidString)), CellItem(data: DataItem(id: UUID().uuidString)), CellItem(data: DataItem(id: UUID().uuidString))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionViewParameters()
        layoutVC()
        collectionView.delegate = self
        
        collectionView.register(StatisticsCollectionViewCell.self, forCellWithReuseIdentifier: StatisticsCollectionViewCell.id)
        
        let cellRegistration = UICollectionView.CellRegistration<StatisticsCollectionViewCell, CellItem> {
            cell, IndexPath, itemIdentifier in
            
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: CellItem) -> UICollectionViewCell? in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            return cell
        }
        
        var firstSnapshot = NSDiffableDataSourceSnapshot<Section, CellItem>()
        firstSnapshot.appendSections([.first])
        firstSnapshot.appendItems(collectionItems, toSection: .first)
        dataSource.apply(firstSnapshot, animatingDifferences: true)
        
    }
    
    func layoutVC(){
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
