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
    
    let questions=["4 + 2 = 6", "5 - 3 > 2", "3 + 8 < 10"]
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text=questions[0]
        // Do any additional setup after loading the view.
    }

    @IBAction func actionPressed(_ sender: UIButton) {
    }
    
}

