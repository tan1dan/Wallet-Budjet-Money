//
//  ChooseDataViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 03/05/2024.
//

import UIKit

class ChooseDataViewController: UIViewController {
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(
            string: "Имя",
            size: 16,
            weight: .bold,
            color: .black
        )
        return label
    }()
    
    var closure: ((String) -> ())?
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.contentMode = .center
        textView.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        textView.textColor = .black
        textView.textAlignment = .center
        let beginning = textView.beginningOfDocument
        textView.selectedTextRange = textView.textRange(from: beginning, to: beginning)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textView.delegate = self
        layoutConstraints()
        nvParameters()
    }
    
    private func layoutConstraints(){
        view.addSubview(labelTitle)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textView.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
            label.attributedText = UIView.stringToNSAttributedString(string: "Имя", size: 18, weight: .semibold , color: .black)
            return view
        }()
        navigationController?.navigationBar.tintColor = .black
    }
}

extension ChooseDataViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Мой счет"
            closure?(textView.text)
        } else {
            closure?(textView.text)
        }
    }
}
