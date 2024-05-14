//
//  WeatherViewController.swift
//  OpenWeather API
//
//  Created by Nizaam Haffejee on 2024/04/18.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var conditionImage: UIImageView!
    @IBOutlet var conditionNameLabel: UILabel!
    @IBOutlet var minimumTemperatureLabel: UILabel!
    @IBOutlet var maximumTemperatureLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    var weatherViewModel: WeatherViewModel?
    var userLocationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherViewModel = WeatherViewModel()
        weatherViewModel?.delegate = self
        
        userLocationManager = CLLocationManager()
        userLocationManager?.delegate = self
        userLocationManager?.requestWhenInUseAuthorization()
    }


    @IBAction func searchButton(_ sender: UIButton) {
        if searchTextField.text != nil {
            weatherViewModel?.fetchWeatherWithCityName(cityName: searchTextField.text ?? "")
            searchTextField.text = ""
        } else {
            searchTextField.placeholder = "Enter something!"
        }
    }
    
    
    @IBAction func locationButtonTapped(_ sender: UIButton) {
        checkLocationPermission()
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        weatherViewModel?.fetchWeatherWithCoordinate(latitude: String(locations[0].coordinate.latitude), longitude: String(locations[0].coordinate.longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        DispatchQueue.main.async { [self] in
            conditionImage.image = UIImage(named: "cloud.slash")
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
