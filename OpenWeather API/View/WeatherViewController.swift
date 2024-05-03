//
//  WeatherViewController.swift
//  OpenWeather API
//
//  Created by Nizaam Haffejee on 2024/04/18.
//

import UIKit

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension WeatherViewController: WeatherViewModelDelegate {
    
    func didUpdateUI(_ weatherData: Weather) {
        DispatchQueue.main.async { [self] in
            cityName.text = weatherData.cityName
            temperatureLabel.text = "\(String(format: "%.0f", weatherData.main.temp))ºC"
        }
    }
}
