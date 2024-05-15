//
//  CustomKeyboardViewController.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 06/05/2024.
//

import UIKit

protocol CustomKeyboardViewControllerDelegate: AnyObject {
    func buttonPressed(sender: CustomKeyboardViewController, button: UIButton)
}

class CustomKeyboardViewController: UIViewController {
    
    var isKeyboardVisible = false
    
    let buttonOne: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "1", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "2", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonThree: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "3", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonFour: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "4", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonFive: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "5", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonSix: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "6", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonSeven: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "7", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonEight: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "8", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonNine: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "9", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonZero: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "0", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonDelete: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: "<", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    let buttonComma: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(UIView.stringToNSAttributedString(string: ".", size: 24, weight: .bold, color: .black), for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    var buttonHeight: CGFloat = 100
    weak var delegate: CustomKeyboardViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutConstraints()
    }
    
    private func layoutConstraints(){
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(buttonFour)
        view.addSubview(buttonFive)
        view.addSubview(buttonSix)
        view.addSubview(buttonSeven)
        view.addSubview(buttonEight)
        view.addSubview(buttonNine)
        view.addSubview(buttonZero)
        view.addSubview(buttonDelete)
        view.addSubview(buttonComma)
        
        NSLayoutConstraint.activate([
            buttonOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonOne.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonOne.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonOne.widthAnchor.constraint(equalTo: buttonTwo.widthAnchor, multiplier: 1),
            
            buttonTwo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonTwo.leadingAnchor.constraint(equalTo: buttonOne.trailingAnchor),
            buttonTwo.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonTwo.widthAnchor.constraint(equalTo: buttonOne.widthAnchor, multiplier: 1),
            
            buttonThree.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonThree.leadingAnchor.constraint(equalTo: buttonTwo.trailingAnchor),
            buttonThree.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonThree.widthAnchor.constraint(equalTo: buttonTwo.widthAnchor, multiplier: 1),
            buttonThree.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonFour.topAnchor.constraint(equalTo: buttonOne.bottomAnchor),
            buttonFour.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonFour.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonFour.widthAnchor.constraint(equalTo: buttonThree.widthAnchor, multiplier: 1),
            
            buttonFive.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor),
            buttonFive.leadingAnchor.constraint(equalTo: buttonFour.trailingAnchor),
            buttonFive.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonFive.widthAnchor.constraint(equalTo: buttonFour.widthAnchor, multiplier: 1),
            
            buttonSix.topAnchor.constraint(equalTo: buttonThree.bottomAnchor),
            buttonSix.leadingAnchor.constraint(equalTo: buttonFive.trailingAnchor),
            buttonSix.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonSix.widthAnchor.constraint(equalTo: buttonFive.widthAnchor, multiplier: 1),
            buttonSix.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonSeven.topAnchor.constraint(equalTo: buttonFour.bottomAnchor),
            buttonSeven.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonSeven.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonSeven.widthAnchor.constraint(equalTo: buttonSix.widthAnchor, multiplier: 1),
            
            buttonEight.topAnchor.constraint(equalTo: buttonFive.bottomAnchor),
            buttonEight.leadingAnchor.constraint(equalTo: buttonSeven.trailingAnchor),
            buttonEight.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonEight.widthAnchor.constraint(equalTo: buttonSeven.widthAnchor, multiplier: 1),
            
            buttonNine.topAnchor.constraint(equalTo: buttonSix.bottomAnchor),
            buttonNine.leadingAnchor.constraint(equalTo: buttonEight.trailingAnchor),
            buttonNine.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonNine.widthAnchor.constraint(equalTo: buttonEight.widthAnchor, multiplier: 1),
            buttonNine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonComma.topAnchor.constraint(equalTo: buttonSeven.bottomAnchor),
            buttonComma.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonComma.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonComma.widthAnchor.constraint(equalTo: buttonNine.widthAnchor, multiplier: 1),
            
            buttonZero.topAnchor.constraint(equalTo: buttonEight.bottomAnchor),
            buttonZero.leadingAnchor.constraint(equalTo: buttonComma.trailingAnchor),
            buttonZero.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonZero.widthAnchor.constraint(equalTo: buttonComma.widthAnchor, multiplier: 1),
            
            buttonDelete.topAnchor.constraint(equalTo: buttonNine.bottomAnchor),
            buttonDelete.leadingAnchor.constraint(equalTo: buttonZero.trailingAnchor),
            buttonDelete.heightAnchor.constraint(equalToConstant: buttonHeight),
            buttonDelete.widthAnchor.constraint(equalTo: buttonZero.widthAnchor, multiplier: 1),
            buttonDelete.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
    @objc func buttonTapped(_ sender: UIButton){
        delegate?.buttonPressed(sender: self, button: sender)
    }
}
