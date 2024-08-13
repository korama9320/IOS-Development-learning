//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController  {


    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherSearch: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager =  CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        weatherSearch.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }



}
//MARK: - UITextFieldDelegate

extension WeatherViewController : UITextFieldDelegate{
    
    @IBAction func searchWeather(_ sender: UIButton) {
        weatherManager.getCityWeather(city: weatherSearch.text?.lowercased() ?? "")
       print(weatherSearch.text ?? "")
        weatherSearch.text = ""
       self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         weatherManager.getCityWeather(city: textField.text?.lowercased() ?? "")
        print(textField.text ?? "")
        textField.text = ""
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         textField.text = ""
    }
}
//MARK: - WeatherManagerDelegate

extension WeatherViewController : WeatherManagerDelegate{
    func didUpdateUI(weatherModel: WeatherModel?) {
        if(weatherModel != nil)
        {
            DispatchQueue.main.async {
                self.temperatureLabel.text = weatherModel!.temperatureString
                self.conditionImageView.image = UIImage(systemName: weatherModel!.Icon)
                self.cityLabel.text = weatherModel!.name
            }
        }
    }
    
    func didFailWithError(error: Error?) {
        print(error!)
    }
}
//MARK: - CLLocationManagerDelegate

extension WeatherViewController : CLLocationManagerDelegate{
    
    @IBAction func locationWeather(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     if let safeLoccation  =  locations.last{
         manager.stopUpdatingLocation()
         weatherManager.getLocationWeather(lat: safeLoccation.coordinate.latitude, lon: safeLoccation.coordinate.longitude)
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == .authorized) { manager.startUpdatingLocation()}
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

