//
//  WeatherIconMapper.swift
//  OpenWeather API
//
//  Created by Nizaam Haffejee on 2024/05/05.
//

import Foundation

struct WeatherIconMapper {
    
    static func sFSymbol(for id: Int) -> String {
        switch id {
            case 200...202:
                return "cloud.bolt.rain"
                
            case 210...212:
                return "cloud.bolt"
                
            case 230...232:
                return "cloud.bolt.rain"
                
            case 300...321:
                return "cloud.drizzle"
                
            case 500...531:
                return "cloud.rain"
                
            case 600...622:
                return "cloud.snow"
                
            case 711:
                return "smoke"
                
            case 721:
                return "sun.haze"
                
            case 741:
                return "cloud.fog"
                
            case 761:
                return "sun.dust"
                
            case 781:
                return "tornado"
                
            case 800:
                return "sun.max"
                
            case 801...804:
                return "cloud"
                
            default:
                return "error"
        }
    }
}
