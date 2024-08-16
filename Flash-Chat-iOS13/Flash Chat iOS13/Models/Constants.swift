//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Roboost Mobile on 11/08/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToLogin"
    static let loginSegue = "LoginToChat"
    static let title = "⚡️FlashChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "massages"
        static let senderField = "sender"
        static let bodyField = "text"
        static let dateField = "date"
    }
}
