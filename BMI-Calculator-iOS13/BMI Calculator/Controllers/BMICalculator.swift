//
//  BMI.swift
//  BMI Calculator
//
//  Created by Roboost Mobile on 29/07/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
struct BMICalculator{

    var bmi : BMI?
    
    mutating func calculateBMI(_ weight : Float,_ height : Float){
        let bmiValue = weight / pow(height, 2)

        if(bmiValue < 18.5){
            
            bmi=BMI(value: bmiValue, advicce: "You Need To Eat More!", color: .cyan)
        }else if(bmiValue < 24.5){
            bmi=BMI(value: bmiValue, advicce: "Well done Keep it going!", color: .green)

        }else{
            bmi=BMI(value: bmiValue, advicce: "You Need To Lose  Weight!", color: .green)
        }
        
    }
}
