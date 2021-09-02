//
//  ViewController.swift
//  SoSimpleMVVM
//
//  Created by KKANG on 2021/07/09.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
//    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var breedPicker: UIPickerView!
    
    var viewmodel: DogViewModel!
    let breeds = ["mal", "pom", "pug", "poo"]
    var selectedBreed: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = ""
        ageLabel.text = ""
        feeLabel.text = ""
        
        breedPicker.dataSource = self
        breedPicker.delegate = self
    }

    @IBAction func ResultPressed(_ sender: UIButton) {
        print("I'm View Controller - ResultPressed")
        let name = nameTextField.text ?? ""
        let age = ageTextField.text ?? "0"
//        let breed = breedTextField.text ?? ""
        
        viewmodel = DogViewModel(name: name, breed: selectedBreed, age: Int(age)!)
        
        viewmodel.configure(self)
    }
    
}

//MARK: - UIPicker

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breeds.count
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedBreed = breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breeds[row]
    }
}

