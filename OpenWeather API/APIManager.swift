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
        defaults.setValue("6d7858c592c25f6b49bc8fc1a6beb5f3", forKey: "apiKey")
    }
    
    func getApiKey() -> String? {
        return defaults.object(forKey: "apiKey") as? String
    }
}
