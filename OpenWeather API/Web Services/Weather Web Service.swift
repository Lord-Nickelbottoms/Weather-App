    //
    //  Weather Web Service.swift
    //  OpenWeather API
    //
    //  Created by Nizaam Haffejee on 2024/04/18.
    //

import Foundation

protocol WeatherWebServiceDelegate: AnyObject {
    func didFetchWeather(weather: Weather)
}

final class WeatherWebService {
    
    weak var delegate: WeatherWebServiceDelegate?
    
    let cityName = "Paris"
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
    var key = ""
    
    func fetchWeatherWithCityName(cityName: String) {
        key = APIManager.shared.getApiKey ?? ""
        print("Requesting...")
        
        if !key.isEmpty {
            let finalURL = "\(baseURL)appid=\(key)&units=metric&q=\(cityName)"
            performRequest(url: finalURL)
        } else {
            print("API key is empty")
        }
    }
    
    func performRequest(url: String) {
        if let url = URL(string: url) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "Default DataTask error!")
                }
                
                if let safeData = data {
                    if let parsedData = self.parseJSON(safeData) {
                        self.delegate?.didFetchWeather(weather: parsedData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ dataToParse: Data) -> Weather? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(Weather.self, from: dataToParse)
            return decodedData
        } catch {
            return nil
        }
    }
}
