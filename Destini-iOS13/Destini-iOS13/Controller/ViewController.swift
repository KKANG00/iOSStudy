//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var sb = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = sb.stories[0].title
        choice1Button.setTitle(sb.stories[0].choice1, for: .normal)
        choice2Button.setTitle(sb.stories[0].choice2, for: .normal)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        updateUI(userChoice: sender.currentTitle!)
    }
    
    func updateUI(userChoice: String){
        let index = sb.nextStory(userChoice: userChoice)
        
        storyLabel.text = sb.stories[index].title
        choice1Button.setTitle(sb.stories[index].choice1, for: .normal)
        choice2Button.setTitle(sb.stories[index].choice2, for: .normal)
    }
    
}

