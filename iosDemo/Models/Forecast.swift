//
//  Forecast.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//

import Foundation

struct Forecast: Codable {
    let latitude: Double
    let longitude: Double
    let hourly: HourlyData

    struct HourlyData: Codable {
        let time: [String]
        let temperature_2m: [Double]
        let weathercode: [Int]
    }
}

struct CityLocation: Codable {
    let name: String
    let latitude: Double
    let longitude: Double
}

struct CityWeather: Identifiable {
    let id = UUID()
    let cityName: String
    let temperature: String
    let time: String
    let weatherCode: Int
    let animationName: String
}
