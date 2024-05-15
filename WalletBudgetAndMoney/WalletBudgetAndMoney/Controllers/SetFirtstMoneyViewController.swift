//
//  SetFirtstMoneyViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 14/05/2024.
//

import UIKit

class SetFirtstMoneyViewController: UIViewController {
    
    let customKeyboard = CustomKeyboardViewController()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "0", size: 70, weight: .semibold, color: .white)
        label.isUserInteractionEnabled = true
        label.textAlignment = .right
        return label
    }()
    
    let buttonSave: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "Сохранить", size: 18, weight: .bold, color: .white), for: .normal)
        button.addTarget(self, action: #selector(buttonSaveTapped), for: .touchUpInside)
        return button
    }()
    
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "PLN", size: 45, weight: .semibold, color: .white)
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
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "Добро пожаловать в WalletApp", size: 30, weight: .semibold, color: .black)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    let firstPhraseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "Настройте Ваш баланс наличных", size: 24, weight: .regular, color: .black)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let secondPhraseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = UIView.stringToNSAttributedString(string: "Сколько денег у вас сейчас в кошельке?", size: 18, weight: .light, color: .black)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var labeTextHeight: CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard)))
        layoutConstraints()
        nvParameters()
        view.backgroundColor = .white
        amountLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelAmountTapped)))
        customKeyboard.delegate = self
        customKeyboard.buttonHeight = 80
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonSave.layer.cornerRadius = buttonSave.frame.size.height / 4
    }
    
    @objc private func buttonSaveTapped(){
        let amountRounding = Double(round(100 * (Double(amountLabel.text ?? "0") ?? 0)) / 100)
        Model.shared.accounts = [AccountItem(id: UUID().uuidString, image: UIImage(systemName: "banknote")?.pngData(), name: "Наличные", amount: amountRounding, currency: "PLN", transactions: [Transaction(id: UUID().uuidString, nameOfAccount: "Наличные", name: "Кошелек", type: .income, category: .income, date: Date(), amount: amountRounding, restAmount: amountRounding)])]
        UserDefaultsManager.shared.create(object: Model.shared.accounts, key: UserDefaultsManager.key)
        let vc = TabBarController()
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
            label.attributedText = UIView.stringToNSAttributedString(string: "WalletApp", size: 18, weight: .semibold , color: .black)
            return view
        }()
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    private func layoutConstraints(){
        headerView.addSubview(amountLabel)
        headerView.addSubview(currencyLabel)
        view.addSubview(headerView)
        view.addSubview(welcomeLabel)
        view.addSubview(firstPhraseLabel)
        view.addSubview(secondPhraseLabel)
        view.addSubview(buttonSave)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 5),
            
            amountLabel.trailingAnchor.constraint(equalTo: currencyLabel.leadingAnchor, constant: -10),
            amountLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),
            
            currencyLabel.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
            currencyLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            
            welcomeLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            firstPhraseLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            firstPhraseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstPhraseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstPhraseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            secondPhraseLabel.topAnchor.constraint(equalTo: firstPhraseLabel.bottomAnchor, constant: 10),
            secondPhraseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondPhraseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            secondPhraseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            
            buttonSave.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            buttonSave.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            buttonSave.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonSave.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func keyboardParameters(){
        addChild(customKeyboard)
    }
    
    @objc func labelAmountTapped(){
        view.addSubview(customKeyboard.view)
        customKeyboard.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customKeyboard.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            customKeyboard.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customKeyboard.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customKeyboard.view.heightAnchor.constraint(equalToConstant: customKeyboard.buttonHeight * 4)
        ])
        amountLabel.isUserInteractionEnabled = false
    }
    
    @objc func dissmisKeyboard(){
        customKeyboard.view.removeFromSuperview()
        
        NSLayoutConstraint.deactivate([
            customKeyboard.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            customKeyboard.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customKeyboard.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customKeyboard.view.heightAnchor.constraint(equalToConstant: customKeyboard.buttonHeight * 4)
        ])
        amountLabel.isUserInteractionEnabled = true
    }
}

extension SetFirtstMoneyViewController: CustomKeyboardViewControllerDelegate {
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
            
            if amountLabel.text?.count ?? 0 >= 6 {
                labeTextHeight = 45
            } else {
                labeTextHeight = 70
            }
        
    }
}

