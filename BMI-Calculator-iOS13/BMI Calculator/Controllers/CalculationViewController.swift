//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {

    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightChange(_ sender: UISlider) {
        height.text = String(format: "%.2f", sender.value)+"m"
    }
    @IBAction func weightChange(_ sender: UISlider) {
        weight.text = String(format: "%.0f", sender.value)+"kg"
    }
    @IBAction func calculateBMI(_ sender: UIButton) {
        let weight : Float = weightSlider.value
        let height : Float = heightSlider.value
        let BMI = weight / pow(height, 2)
        
    }
    

}

