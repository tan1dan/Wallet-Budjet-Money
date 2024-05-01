//
//  DataModel.swift
//  SwiftGraphKit_Example
//
//  Created by Charles Bessonnet on 25/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

struct DailyReport {
    var index: Int
    var date: Date
    var amount: CGFloat
}

class GraphDataModel {

    var reports = [DailyReport]()
    
    var dataFrame: CGRect {
        return CGRect(x: 0, y: 0, width: 20, height: 7000)
    }
    
    init() {
        
//        let date = Date()
//        let max  = Int(dataFrame.width)
//        
//        let minAmount = Float(dataFrame.minY)
//        let maxAmount = Float(dataFrame.maxY)
//        
//        for i in 0..<max {
//            let amount = CGFloat(Float.random(in: minAmount..<maxAmount))
//            let day: TimeInterval = 24 * 60 * 60
//            let currentDate = date.addingTimeInterval(TimeInterval(i - max) * day)
//            let report = DailyReport(index: i, date: currentDate, amount: amount)
//            
//            reports.append(report)
//        }
        let day: TimeInterval = 24 * 60 * 60
        reports.append(DailyReport(index: 0, date: Date(), amount: 1000))
        reports.append(DailyReport(index: 1, date: Date().addingTimeInterval(day), amount: 1500))
        reports.append(DailyReport(index: 2, date: Date().addingTimeInterval(2 * day), amount: 400))
        reports.append(DailyReport(index: 3, date: Date().addingTimeInterval(3 * day), amount: 300))
        reports.append(DailyReport(index: 4, date: Date().addingTimeInterval(4 * day), amount: 200))
        reports.append(DailyReport(index: 5, date: Date().addingTimeInterval(5 * day), amount: 0))
        reports.append(DailyReport(index: 6, date: Date().addingTimeInterval(6 * day), amount: 0))
        reports.append(DailyReport(index: 7, date: Date().addingTimeInterval(7 * day), amount: 0))
        reports.append(DailyReport(index: 8, date: Date().addingTimeInterval(8 * day), amount: 0))
        reports.append(DailyReport(index: 9, date: Date().addingTimeInterval(9 * day), amount: 0))
        reports.append(DailyReport(index: 10, date: Date().addingTimeInterval(10 * day), amount: 0))
        reports.append(DailyReport(index: 11, date: Date().addingTimeInterval(11 * day), amount: 6000))
        
    }
    
    public func report(for index: Int) -> DailyReport? {
        return reports.first(where: { $0.index == index })
    }
    
}
