//
//  ResultViewController.swift
//  Tipsy
//
//  Created by KKANG on 2021/06/30.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result = 0.00
    var split = 2
    var tipPct = 10

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(result)
        settingLabel.text = "Split between \(split) people, with \(tipPct)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalaulatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
