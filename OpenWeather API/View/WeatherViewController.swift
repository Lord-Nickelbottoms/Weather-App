//
//  WeatherViewController.swift
//  OpenWeather API
//
//  Created by Nizaam Haffejee on 2024/04/18.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var conditionImage: UIImageView!
    @IBOutlet var minimumTemperatureLabel: UILabel!
    @IBOutlet var maximumTemperatureLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherViewModel = WeatherViewModel()
        weatherViewModel?.delegate = self
    }


}

extension WeatherViewController: WeatherViewModelDelegate {
    
    func didUpdateUI(_ weatherData: Weather) {
        DispatchQueue.main.async { [self] in
            cityNameLabel.text = weatherData.cityName
            temperatureLabel.text = "\(String(format: "%.0f", weatherData.main.temp))ºC"
        }
    }
}
