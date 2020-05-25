//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggCollect: [String:Int] = ["Soft":240,"Medium":300,"Hard":360]
    var counter:Float = 30.0
    var totalTime:Float = 30.0
    var timer = Timer()
   
    @IBAction func eggButton(_ sender: UIButton) {
        timer.invalidate()
        let name = sender.currentTitle!
        counter = Float(eggCollect[name]!)
        totalTime = Float(eggCollect[name]!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        progressBar.progress = 0
        titleText.text = name + " egg is on the way!"
    }
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            counter -= 1
            progressBar.progress = 1-counter/totalTime
        } else {
            timer.invalidate()
            titleText.text = "Done!"
        }
    }
    

}
