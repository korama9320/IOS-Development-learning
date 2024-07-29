//
//  BMI.swift
//  BMI Calculator
//
//  Created by Roboost Mobile on 29/07/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit
class BMI{
    let value : Float
    let advice : String
    let color : UIColor
    
    init(value: Float, advicce: String, color: UIColor) {
        self.value = value
        self.advice = advicce
        self.color = color
    }
}
