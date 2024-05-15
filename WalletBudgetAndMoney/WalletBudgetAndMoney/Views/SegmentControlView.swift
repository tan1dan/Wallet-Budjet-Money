//
//  SegmentControlView.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 13/05/2024.
//

import UIKit

class SegmentControlView: UIView {
    
    let segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl()
        segmentControl.insertSegment(withTitle: "Неделя", at: 0, animated: false)
        segmentControl.insertSegment(withTitle: "Месяц", at: 1, animated: false)
        segmentControl.insertSegment(withTitle: "Три месяца", at: 2, animated: false)
        segmentControl.insertSegment(withTitle: "Полгода", at: 3, animated: false)
        segmentControl.insertSegment(withTitle: "Год", at: 4, animated: false)
        segmentControl.selectedSegmentIndex = 1
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.selectedSegmentTintColor = .systemBlue
        segmentControl.tintColor = .white
        return segmentControl
    }()
    
    
    var segmentControlPressed: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        segmentControl.addTarget(self, action: #selector(segmentControlValueChanged), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func segmentControlValueChanged(){
        segmentControlPressed?()
    }
    
    private func layout(){
        
        addSubview(segmentControl)
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            segmentControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            segmentControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            segmentControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    
}
