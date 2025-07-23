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
    }
}

struct CityLocation: Codable {
    let name: String
    let latitude: Double
    let longitude: Double
}
