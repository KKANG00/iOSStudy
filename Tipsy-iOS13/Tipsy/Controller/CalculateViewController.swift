//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var tipPct = 0.0
    var splitValue = 2
    var totalValue = 0.00
    var result = 0.00

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
        tenPctButton.isSelected = false
        
        sender.isSelected = true
        tipPct = Double(String(sender.currentTitle!.dropLast()))! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitValue = Int(sender.value)
        splitNumberLabel.text = String(splitValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billtext = billTextField.text!
        let split = Double(billtext)! * (tipPct+1) / Double(splitValue)
        result = Double(String(format: "%.2f", split))!
        print(result)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
//            let destinationVC = ResultViewController(result)
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = result
            destinationVC.tipPct = Int(tipPct * 100)
            destinationVC.split = Int(splitValue)
        }
    }
    
}

