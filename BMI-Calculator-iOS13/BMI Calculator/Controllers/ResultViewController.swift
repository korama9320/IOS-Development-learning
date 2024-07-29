//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Roboost Mobile on 28/07/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmi : BMI?
    
    @IBOutlet weak var bmiLable: UILabel!
    @IBOutlet weak var adviceLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLable.text = String(format: "%.0f", bmi?.value ?? 0.0)
        adviceLable.text = bmi?.advice
        view.backgroundColor = bmi?.color
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
