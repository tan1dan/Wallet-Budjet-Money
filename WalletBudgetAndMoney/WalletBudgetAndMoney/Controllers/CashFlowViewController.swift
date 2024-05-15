//
//  CashFlowViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 26/04/2024.
//

import UIKit

class CashFlowViewController: UIViewController, UICollectionViewDelegate {
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCompositionalLayout())
    let segmentView = SegmentControlView()
    var items: [CellItem] = [CellItem()]
    
    var dataSource: UICollectionViewDiffableDataSource<Section, CellItem>!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionViewParameters()
        layoutVC()
        nvParameters()
        segmentViewParameters()
        collectionView.register(CashFlowCollectionViewCell.self, forCellWithReuseIdentifier: CashFlowCollectionViewCell.id)
        collectionView.delegate = self
        
        let cashFlowCellRegistration = UICollectionView.CellRegistration<CashFlowCollectionViewCell, CellItem> {
            cell, indexPath, itemIdentifier in
            
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: CellItem) -> UICollectionViewCell? in

                let cell = collectionView.dequeueConfiguredReusableCell(using: cashFlowCellRegistration, for: indexPath, item: itemIdentifier)
                cell.buttonShowMoreCashFlow.isHidden = true
                cell.selectedIndex = self.segmentView.segmentControl.selectedSegmentIndex
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
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: segmentView.topAnchor),
            
            segmentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            segmentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func nvParameters(){
        navigationItem.titleView = {
            let view = UIView()
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.topAnchor),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
            label.attributedText = UIView.stringToNSAttributedString(string: "Денежный поток", size: 18, weight: .semibold , color: .black)
            return view
        }()
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func segmentViewParameters(){
        segmentView.layer.shadowColor = UIColor.gray.cgColor
        segmentView.layer.shadowOpacity = 0.5
        segmentView.layer.shadowOffset = CGSize(width: 4, height: 4)
        segmentView.layer.shadowRadius = 4
        segmentView.segmentControlPressed = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}
    
