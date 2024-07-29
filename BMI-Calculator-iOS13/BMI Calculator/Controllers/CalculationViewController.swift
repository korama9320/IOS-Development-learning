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
    var bmi : BMI = BMI()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightChange(_ sender: UISlider) {
        bmi.updateHeight(sender.value)

        height.text = String(format: "%.2f", sender.value)+"m"
    }
    @IBAction func weightChange(_ sender: UISlider) {
        bmi.updateWeight(sender.value)
        weight.text = String(format: "%.0f", sender.value)+"kg"
        
    }
    @IBAction func calculateBMI(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResultScreen", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destenation = segue.destination as? ResultViewController
        destenation?.bmiValue = bmi.calculateBMI()
        
    }
    
}
