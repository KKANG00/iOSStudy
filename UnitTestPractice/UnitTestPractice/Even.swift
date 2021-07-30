//
//  Even.swift
//  UnitTestPractice
//
//  Created by KKANG on 2021/07/22.
//

import Foundation

struct Even {
    let number: Int
    var isEven: Bool { get {
        return number % 2 == 0
        }
    }
}
