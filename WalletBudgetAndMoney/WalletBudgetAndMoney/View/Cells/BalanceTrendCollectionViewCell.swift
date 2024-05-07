//
//  BalanceTrendCollectionViewCell.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 26/04/2024.
//

import UIKit

class BalanceTrendCollectionViewCell: UICollectionViewCell {
    
    static let id = "BalanceTrendCollectionViewCell"
    
    let labelBalanceTrend = UILabel()
    let graph = ComplexeGraphViewController()
    
    let labelDateBalanceTrend = UILabel()
    let labelAmountBalanceTrend = UILabel()
    let buttonShowMoreBalanceTrend = UIButton()
    var buttonShowMorePressed: (() -> Void)?
    var data: [CellItem] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = frame.size.width / 7
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 4
        
        layoutCashFlow()
        
        labelBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Денежный поток", size: 26, weight: .bold, color: .black)
        labelDateBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "Текущий месяц", size: 17, weight: .regular, color: .gray
        )
        labelAmountBalanceTrend.attributedText = UIView.stringToNSAttributedString(string: "-20.00 zł", size: 35, weight: .bold, color: .black)
        buttonShowMoreBalanceTrendParameters()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutCashFlow(){
        let graphView = graph.view ?? UIView()
        labelBalanceTrend.translatesAutoresizingMaskIntoConstraints = false
        buttonShowMoreBalanceTrend.translatesAutoresizingMaskIntoConstraints = false
        labelDateBalanceTrend.translatesAutoresizingMaskIntoConstraints = false
        labelAmountBalanceTrend.translatesAutoresizingMaskIntoConstraints = false
        graphView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelBalanceTrend)
        contentView.addSubview(buttonShowMoreBalanceTrend)
        contentView.addSubview(labelDateBalanceTrend)
        contentView.addSubview(labelAmountBalanceTrend)
        contentView.addSubview(graphView)
        
        NSLayoutConstraint.activate([
            labelBalanceTrend.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelBalanceTrend.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            
            labelDateBalanceTrend.topAnchor.constraint(equalTo: labelBalanceTrend.bottomAnchor, constant: 10),
            labelDateBalanceTrend.leadingAnchor.constraint(equalTo: labelBalanceTrend.leadingAnchor),
            
            
            labelAmountBalanceTrend.topAnchor.constraint(equalTo: labelDateBalanceTrend.bottomAnchor, constant: 5),
            labelAmountBalanceTrend.leadingAnchor.constraint(equalTo: labelDateBalanceTrend.leadingAnchor),
            
            graphView.topAnchor.constraint(equalTo: labelAmountBalanceTrend.bottomAnchor, constant: 10),
            graphView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            graphView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            graphView.heightAnchor.constraint(equalToConstant: 250),
            
            buttonShowMoreBalanceTrend.topAnchor.constraint(equalTo: graphView.bottomAnchor, constant: 5),
            buttonShowMoreBalanceTrend.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            buttonShowMoreBalanceTrend.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func buttonShowMoreBalanceTrendParameters(){
        buttonShowMoreBalanceTrend.setAttributedTitle(UIView.stringToNSAttributedString(string: "Показать больше", size: 18, weight: .bold, color: .systemBlue), for: .normal)
        buttonShowMoreBalanceTrend.addTarget(nil, action: #selector(buttonShowMoreAction), for: .touchUpInside)
    }
    
    @objc private func buttonShowMoreAction(){
        buttonShowMorePressed?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        graph.model.updateData()
    }
}
