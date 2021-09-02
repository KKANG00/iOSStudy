//
//  DogViewModel.swift
//  SoSimpleMVVM
//
//  Created by KKANG on 2021/07/09.
//

import Foundation

class DogViewModel {
    let dog: Dog
    
    init(name: String, breed: String, age: Int) {
        print("I'm DogViewModel - init")
        self.dog = Dog(name: name, breed: breed, age: age)
    }
    
    var name: String {
        return dog.name
    }
    
    var ageText: String {
        
        return "\(dog.age) years old"
    }
    
    var adoptionFeeText: String {
        switch dog.breed {
        case .mal:
            return "20"
        case .pom:
            return "50"
        case .poo:
            return "40"
        case .pug:
            return "60"
        }
    }
    
}

extension DogViewModel {
    func configure(_ vc: ViewController) {
        print("I'm DogViewModel - configure")
        vc.nameLabel.text = name
        vc.ageLabel.text = ageText
        vc.feeLabel.text = adoptionFeeText
    }
}
