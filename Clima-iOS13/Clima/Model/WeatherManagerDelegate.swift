//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Roboost Mobile on 06/08/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateUI(weatherModel : WeatherModel?)
    func didFailWithError(error : Error?)
}
