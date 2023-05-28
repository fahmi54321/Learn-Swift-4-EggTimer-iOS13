//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let egsTimes = ["Soft" : 300,"Medium" : 420,"Hard" : 720]
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPass = 0
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = egsTimes[hardness]!
        
        totalTime = 0
        secondsPass = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if(secondsPass < totalTime){
            
            secondsPass += 1

            let persentaseProgress = Float(secondsPass) / Float(totalTime)
            progressBar.progress = persentaseProgress

        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    
}
