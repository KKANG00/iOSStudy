//
//  BMI.swift
//  BMI Calculator
//
//  Created by KKANG on 2021/06/25.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct BMI {
    let value: Float
    let advice: String
    let color: UIColor
    
    init(_ value: Float, _ advice: String, _ color: UIColor) {
        self.value = value
        self.advice = advice
        self.color = color
    }
}
