//
//  UIViewController + ext.swift
//  WalletBudgetAndMoney
//
//  Created by Иван Знак on 06/05/2024.
//

import UIKit

extension UIViewController {
    func showAlertVC(_ title: String, description: String, completion: ((Bool) -> (Void))?) {
       let controller = UIAlertController(title: title, message: description, preferredStyle: .alert)
       controller.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
           completion?(true)
       }))
       self.present(controller, animated: true)
   }
}
