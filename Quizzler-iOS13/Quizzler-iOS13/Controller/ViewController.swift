//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var proressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var multiChoicce: UIButton!
    
    var timer = Timer()
    var quizbrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        if quizbrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        quizbrain.nextQuestion()
    }
    
    @objc func updateUI() {
        questionLabel.text = quizbrain.getQuestionText()
        
        let choices = quizbrain.getChoices()
        
        trueButton.setTitle(choices[0], for: .normal)
        falseButton.setTitle(choices[1], for: .normal)
        if choices.count > 2 {
            //multi
            multiChoicce.setTitle(choices[2], for: .normal)
            multiChoicce.isHidden = false
        }
        else {
            multiChoicce.isHidden = true
        }
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        multiChoicce.backgroundColor = UIColor.clear
        
        timer.invalidate()
        
        proressBar.progress = quizbrain.getProgress()
        scoreLabel.text = "Score: \(quizbrain.getScore())"
    }
    
}

