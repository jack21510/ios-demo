//
//  CityLocationLoader.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//

import Foundation

class CityLocationLoader {
    static func load() -> [CityLocation] {
        guard let url = Bundle.main.url(forResource: "TaiwanCityCoordinates", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let cities = try? JSONDecoder().decode([CityLocation].self, from: data)
        else {
            return []
        }
        return cities
    }
}
