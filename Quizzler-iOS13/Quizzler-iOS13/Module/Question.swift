//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by KKANG on 2021/06/22.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let choices: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.choices = a
        self.correctAnswer = correctAnswer
    }
}
