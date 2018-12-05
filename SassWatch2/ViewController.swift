//
//  ViewController.swift
//  SassWatch2
//
//  Created by Liana Haque on 12/5/18.
//  Copyright © 2018 Liana Haque. All rights reserved.
//

import UIKit
import SwiftMessages

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var fractionsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    var (hours, minutes, seconds, fractions) = (0,0,0,0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.timerProgress), userInfo: nil, repeats: true)
        
        startButton.isHidden = true
    }
    
    @objc func timerProgress(){
        fractions += 1
        if fractions > 99 {
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        if minutes == 60 {
            hours += 1
            minutes = 0
        }
        
        let secondsLabel = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesLabel = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        let hoursLabel = hours > 9 ? "\(hours)" : "0\(hours)"
        
        timeLabel.text = "\(hoursLabel):\(minutesLabel):\(secondsLabel)"
        fractionsLabel.text = ".\(fractions)"
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        startButton.isHidden = false
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        var (hours, minutes, seconds, fractions) = (0,0,0,0)
        
        timeLabel.text = "00:00:00"
        fractionsLabel.text = ".00"
        startButton.isHidden = false
        
    }
    
    
    

}

