//
//  WeatherViewModel.swift
//  OpenWeather API
//
//  Created by Nizaam Haffejee on 2024/04/18.
//

import Foundation

protocol WeatherViewModelDelegate: AnyObject {
    
    func didUpdateUI(_ weatherData: Weather)
}

class WeatherViewModel: WeatherWebServiceDelegate {
    
    var weatherWebService = WeatherWebService()
    weak var delegate: WeatherViewModelDelegate?
    var weatherData: Weather?
    
    init() {
        weatherWebService.delegate = self
    }
    
    func fetchWeatherWithCityName(cityName: String) {
        weatherWebService.fetchWeatherWithCityName(cityName: cityName)
    }
    
    func didFetchWeather(weather: Weather) {
        self.weatherData = weather
        delegate?.didUpdateUI(weather)
    }
    
}
