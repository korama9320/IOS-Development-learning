//
//  question.swift
//  Quizzler-iOS13
//
//  Created by Roboost Mobile on 27/07/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
struct Question{
    let  question : String
    let  answer : String
 
    init(q question : String , a answer : String) {
        self.question = question
        self.answer = answer
    }
}
