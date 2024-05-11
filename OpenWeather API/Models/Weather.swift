    //
    //  Weather.swift
    //  OpenWeather API
    //
    //  Created by Nizaam Haffejee on 2024/04/18.
    //
    // This code below was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let weather = try? JSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

    // MARK: - Weather
struct Weather: Codable {
    let coordinates: Coord
    let weather: [WeatherElement]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let deltaTime: Int
    let systemData: Sys
    let timezone: Int
    let id: Int
    let cityName: String
    let cod: Int
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case deltaTime = "dt"
        case systemData = "sys"
        case timezone = "timezone"
        case id = "id"
        case cityName = "name"
        case cod = "cod"
    }
}

    // MARK: - Clouds
struct Clouds: Codable {
    
    let all: Int
    
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

    // MARK: - Coord
struct Coord: Codable {
    
    let lon: Double
    let lat: Double
    
    enum CodingKeys: String, CodingKey {
        case lon = "lon"
        case lat = "lat"
    }
}

    // MARK: - Main
struct Main: Codable {
    
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}

    // MARK: - Sys
struct Sys: Codable {
    
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}

    // MARK: - WeatherElement
struct WeatherElement: Codable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    var weatherType: String {
        return WeatherIconMapper.sFSymbol(for: id)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

    // MARK: - Wind
struct Wind: Codable {
    
    let speed: Double
    let deg: Int
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
}
