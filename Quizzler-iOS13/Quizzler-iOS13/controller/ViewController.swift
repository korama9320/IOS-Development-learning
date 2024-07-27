//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    var quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionPressed(_ sender: UIButton) {
        let userAnswer : String = sender.currentTitle!
        
        let  answer = quiz.checkAnswer(userAnswer)
        if(answer){sender.backgroundColor = UIColor.green }else {sender.backgroundColor=UIColor.red}
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updateUI), userInfo: 1, repeats:false)
        
    }
    
    @objc func updateUI(){
        questionText.text = quiz.nextQuestion()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progress.progress = quiz.progress()
        score.text = quiz.getScore()
    }
    
}

