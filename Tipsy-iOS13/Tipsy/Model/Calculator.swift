//
//  Calculator.swift
//  Tipsy
//
//  Created by 강지우 on 2021/10/01.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

class Calculator {
    func calculateSplit(bill: Double, tipPercent: Double, splitNum: Double) -> Double {
        let split = bill * (tipPercent+1) / splitNum
        let result = Double(String(format: "%.2f", split))!
        
        return result
    }
}
