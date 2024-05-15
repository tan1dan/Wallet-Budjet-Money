//
//  FirstBalanceViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 06/05/2024.
//

import UIKit

class FirstBalanceViewController: UIViewController {
    
    let customKeyboard = CustomKeyboardViewController()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "0", size: 70, weight: .semibold, color: .white)
        label.isUserInteractionEnabled = true
        label.textAlignment = .right
        return label
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        return view
    }()
    
    
    var labeTextHeight: CGFloat = 70
    var closure: ((String) -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard)))
        layoutConstraints()
        nvParameters()
        view.backgroundColor = .white
        amountLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelAmountTapped)))
        customKeyboard.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        closure?(amountLabel.text ?? "0,00")
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
            label.attributedText = UIView.stringToNSAttributedString(string: "Баланс", size: 18, weight: .semibold , color: .black)
            return view
        }()
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    private func layoutConstraints(){
        headerView.addSubview(amountLabel)
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            amountLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            amountLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),
        ])
    }
    
    func keyboardParameters(){
        addChild(customKeyboard)
    }
    
    @objc func labelAmountTapped(){
        view.addSubview(customKeyboard.view)
        customKeyboard.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customKeyboard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customKeyboard.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customKeyboard.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customKeyboard.view.heightAnchor.constraint(equalToConstant: customKeyboard.buttonHeight * 4)
        ])
        amountLabel.isUserInteractionEnabled = false
    }
    
    @objc func dissmisKeyboard(){
        customKeyboard.view.removeFromSuperview()
        
        NSLayoutConstraint.deactivate([
            customKeyboard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customKeyboard.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customKeyboard.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customKeyboard.view.heightAnchor.constraint(equalToConstant: customKeyboard.buttonHeight * 4)
        ])
        amountLabel.isUserInteractionEnabled = true
    }
}

extension FirstBalanceViewController: CustomKeyboardViewControllerDelegate {
    func buttonPressed(sender: CustomKeyboardViewController, button: UIButton) {
       
            guard let text = button.titleLabel?.text else {return}
            switch text {
            case "<":
                if amountLabel.text?.count ?? 0 >= 2{
                    amountLabel.text?.removeLast()
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: amountLabel.text!, size: labeTextHeight, weight: .semibold, color: .white)
                } else {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: "0", size: labeTextHeight, weight: .semibold, color: .white)
                }
            case ",":
                guard amountLabel.text?.count ?? 0 < 9 else {return}
                if amountLabel.text?.contains(",") ?? true {
                    return
                } else {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: amountLabel.text! + text, size: labeTextHeight , weight: .semibold, color: .white)
                }
                    
            case "0":
                guard amountLabel.text?.count ?? 0 < 9 else {return}
                if amountLabel.text! == "0" {
                    return
                } else {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: amountLabel.text! + text, size: labeTextHeight , weight: .semibold, color: .white)
                }
            default:
                guard amountLabel.text?.count ?? 0 < 9 else {return}
                if amountLabel.text! == "0" {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: text, size: labeTextHeight , weight: .semibold, color: .white)
                } else {
                    amountLabel.attributedText = UIView.stringToNSAttributedString(string: amountLabel.text! + text, size: labeTextHeight , weight: .semibold, color: .white)
                }
            }
            
            if amountLabel.text?.count ?? 0 >= 8 {
                labeTextHeight = 65
            } else {
                labeTextHeight = 70
            }
        
    }
}

