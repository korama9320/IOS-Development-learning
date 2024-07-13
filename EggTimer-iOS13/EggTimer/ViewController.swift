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
   
    var eggCookTime : [String : Int] = ["Soft" : 5,"Medium" : 7,"Hard":12]
  
    @IBOutlet weak var done: UILabel!
    var cookTime=5
    var prog=0
    var timer=Timer()
    var player: AVAudioPlayer!

    @IBAction func startTimer(_ sender: UIButton) {
        done.text="How do you like your eggs?"
        timer.invalidate()
        prog=0
         cookTime=eggCookTime[sender.currentTitle!]!
        print(cookTime)
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(updateProgress), userInfo: 1, repeats:true)
    }
    
    @IBOutlet weak var boilingProgress: UIProgressView!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   @objc func updateProgress(){
       
       if prog < cookTime {
           print(prog)
           prog+=1
           boilingProgress.progress=Float(prog)/Float(cookTime)}
            else
            {
                playSound()
                done.text="Done!!"
                timer.invalidate()
            }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf:url!)
        player.play()
                
    }
}
