//
//  UIView + ext.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 25/04/2024.
//

import UIKit

extension UIView {
    
    static func stringToNSAttributedString(string: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) -> NSMutableAttributedString {
        let ns = NSMutableAttributedString(string: string)
        let range = (ns.string as NSString).range(of: string)
        ns.addAttribute(.font, value: UIFont.systemFont(ofSize: size, weight: weight), range: range)
        ns.addAttribute(.foregroundColor, value: color, range: range)
        return ns
    }
    
}
