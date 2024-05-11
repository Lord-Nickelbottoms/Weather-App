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
    @IBOutlet var conditionNameLabel: UILabel!
    @IBOutlet var minimumTemperatureLabel: UILabel!
    @IBOutlet var maximumTemperatureLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherViewModel = WeatherViewModel()
        weatherViewModel?.delegate = self
    }


    @IBAction func searchButton(_ sender: UIButton) {
        if searchTextField.text != nil {
            weatherViewModel?.fetchWeatherWithCityName(cityName: searchTextField.text ?? "")
            searchTextField.text = ""
        } else {
            searchTextField.placeholder = "Enter something!"
        }
    }
}

extension WeatherViewController: WeatherViewModelDelegate {
    
    func didUpdateUI(_ weatherData: Weather) {
        DispatchQueue.main.async { [self] in
            cityNameLabel.text = weatherData.cityName
            temperatureLabel.text = "\(String(format: "%.0f", weatherData.main.temp))ºC"
            conditionImage.image = UIImage(named: weatherData.weather[0].icon)
            conditionNameLabel.text = weatherData.weather[0].description.capitalized
            minimumTemperatureLabel.text = "Min: \(String(format: "%.0f", weatherData.main.tempMin))ºC"
            maximumTemperatureLabel.text =  "Max: \(String(format: "%.0f", weatherData.main.tempMax))ºC"
            feelsLikeLabel.text =  "Feels Like: \(String(format: "%.0f", weatherData.main.feelsLike))ºC"
            
            if weatherData.weather[0].weatherType == "cloud.slash" {
                conditionImage.image = UIImage(named: "cloud.slash")
            } else {
                conditionImage.image = UIImage(systemName: weatherData.weather[0].weatherType)
            }
        }
    }
}
