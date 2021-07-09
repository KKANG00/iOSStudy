//
//  Dog.swift
//  SoSimpleMVVM
//
//  Created by KKANG on 2021/07/09.
//

import Foundation

class Dog {
    enum Breed {
        case mal
        case pom
        case pug
        case poo
    }
    
    let name: String
    let breed: Breed
    let age: Int
    
    init(name: String, breed: String, age: Int) {
        print("init Model")
        var brd: Breed
        
        switch breed {
        case "mal":
            brd = .mal
            break
        case "pom":
            brd = .pom
            break
        case "pug":
            brd = .pug
            break
        case "poo":
            brd = .poo
            break
        default:
            brd = .mal
        }
        
        self.name = name
        self.breed = brd
        self.age = age
    }
    
}
