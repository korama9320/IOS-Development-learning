//
//  WeatherManager.swift
//  Clima
//
//  Created by Roboost Mobile on 05/08/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
struct WeatherManager {
    let cityWeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4b3733d0b4469b81b15be2fd10c7f876&units=metric&"
    
    var delegate : WeatherViewController?

    func getCityWeather(city : String) {
        let url = "\(cityWeatherURL)q=\(city)"
        weatherRequest(url: url)
    }
    
    func getLocationWeather(lat:Double,lon:Double){
        let url = "\(cityWeatherURL)lat=\(lat)&lon=\(lon)"
        weatherRequest(url: url)
    }
    
   func weatherRequest(url : String){
       let url = URL(string:url)

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, urlResponce, error in
            if(error != nil){
                self.delegate?.didFailWithError(error: error)
                return
            }
            if let safeData = data {
                print(String(data: safeData, encoding: .utf8) ?? "")
                let weatherData = self.parceJson(data: safeData)
                self.delegate?.didUpdateUI(weatherModel : weatherData)
            }
        }
        task.resume()
    }
 
    func parceJson(data : Data)-> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData =  try decoder.decode(WeatherData.self, from: data)
           let weatherModel = WeatherModel(id: decodedData.weather[0].id, temperature: decodedData.main.temp, name: decodedData.name)
            return weatherModel

        }catch{
            self.delegate?.didFailWithError(error: error)
        }
        return nil
    }
    
    
    
}

