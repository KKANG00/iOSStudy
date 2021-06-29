//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let dic = ["Soft":3, "Medium": 4, "Hard":7]
    var secondsRemaining = 60
    var time = 60
    var timer = Timer()
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        progressBar.progress = 0.0
        Label.text = "\(hardness)..."
        
        secondsRemaining = dic[hardness]!
        time = secondsRemaining
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer(){
        if secondsRemaining > 0{
            let progress = 1-(Float(secondsRemaining)/Float(time))
            print("\(secondsRemaining) seconds")
            progressBar.progress = progress
            secondsRemaining -= 1
        }
        else {
            timer.invalidate()  //cancle timer
            progressBar.progress = 1.0
            Label.text = "Done!"
            playSound(resource: "alarm_sound")
        }
    }
    
    func playSound(resource: String) {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "mp3") else { return }

        do {
            //playback => 무음모드에서도 소리나도록 강제
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
