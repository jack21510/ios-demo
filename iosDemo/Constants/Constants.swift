//
//  Constants.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//

enum Constants {
    
    enum API {
        #if DEV
        static let baseUrl = "https://api.open-meteo.com/v1"
        #else
        static let baseUrl = "https://api.open-meteo.com/v1"
        #endif
    }
    
    
    enum Method {
        static let forecast = "/forecast"
    }
}
