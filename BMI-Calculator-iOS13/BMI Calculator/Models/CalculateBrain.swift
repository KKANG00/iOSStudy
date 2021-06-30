//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by KKANG on 2021/06/25.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculateBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(_ height: Float, _ weight: Float) {
        let bmiValue = height == 0 ? 0 : weight/pow(height, 2)
        let state = getState(bmiValue: bmiValue)
        
        switch state {
        case "Underweight":
            bmi = BMI(bmiValue, "Eat more pies!", .blue)
            break
        case "Normal":
            bmi = BMI(bmiValue, "Fit as a fiddle!", .green)
            break
        case "Overweight":
            bmi = BMI(bmiValue, "Eat less pies.", .red)
            break
        default:
            bmi = BMI(bmiValue, "Fit as a fiddle!", .green)
        }
        
    }
    
    func getState(bmiValue: Float) -> String {
        if bmiValue < 18.5 {
            return "Underweight"
        }
        else if bmiValue <= 24.9 {
            return "Normal"
        }
        
        return "Overweight"
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return (bmi?.advice ?? "No Advice")
    }
    
    func getBackgroundColor() -> UIColor {
        return (bmi?.color ?? .red)
    }
}
