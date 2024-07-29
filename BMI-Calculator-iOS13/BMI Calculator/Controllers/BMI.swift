//
//  BMI.swift
//  BMI Calculator
//
//  Created by Roboost Mobile on 29/07/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
struct BMI{
    var weight : Float = 0.0
    var height : Float = 0.0
  
    
    mutating func updateWeight(_ weight : Float){
        self.weight = weight
    }
    
    mutating func updateHeight(_ height : Float){
        self.height = height
    }
    
    func calculateBMI()->String{
        let bmiValue = weight / pow(height, 2)
        let  bmi=String(format: "%.2f", bmiValue)
        return  bmi
    }
}
