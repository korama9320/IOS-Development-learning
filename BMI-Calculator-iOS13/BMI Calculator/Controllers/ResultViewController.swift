//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Roboost Mobile on 28/07/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue : String?
    
    @IBOutlet weak var bmiLable: UILabel!
    @IBOutlet weak var adviceLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLable.text = bmiValue
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
