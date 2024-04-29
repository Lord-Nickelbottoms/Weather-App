//
//  APIManager.swift
//  OpenWeather API
//
//  Created by Nizaam Haffejee on 2024/04/19.
//

import Foundation

//MARK: - This class is solely for API Key operations

class APIManager {
    
    static let shared = APIManager()
    
    private let defaults = UserDefaults.standard
    
    private init() {
        
    }
    
    func setApiKey(_ keyToStore: String) {
        defaults.setValue(keyToStore, forKey: "apiKey")
    }
    
    var getApiKey: String? {
        return defaults.object(forKey: "apiKey") as? String
    }
}
