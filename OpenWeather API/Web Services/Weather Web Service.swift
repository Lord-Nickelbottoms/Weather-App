//
//  Weather Web Service.swift
//  OpenWeather API
//
//  Created by Nizaam Haffejee on 2024/04/18.
//

import Foundation

final class WeatherWebService {
    
    let cityName = "Paris"
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
    
    let apiManager: APIManager? = nil
    var key = ""
    
    init() {
        self.key = apiManager?.getApiKey() ?? ""
    }
    
    func fetchWeatherWithCityName(cityName: String) {
        let finalURL =  "\(baseURL)appid=\(key)&units=metric&q=\(cityName)"
    }
    
    func performRequest(url: String, completion: @escaping(Any) -> Void) {
        if let url = URL(string: url) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion(error ?? "Default DataTask error!")
                }
                
                if let safeData = data {
                    let parsedData = self.parseJSON(safeData)
                    completion(parsedData as Any)
                }
            }
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
