//
//  APIManager.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//

import Foundation
import Moya

class WeatherManager {
    static let shared = WeatherManager()
    
    private let provider = MoyaProvider<WeatherAPI>()
    
    // 取得所有城市的天氣資料
    func fetchWeatherForAllCities(completion: @escaping ([String: Forecast]) -> Void) {
        let cities = CityLocationLoader.load()
        var results: [String: Forecast] = [:]
        let group = DispatchGroup()

        for city in cities {
            group.enter()
            
            provider.request(.forecast(latitude: city.latitude, longitude: city.longitude, hourly: "temperature_2m,weathercode")) { result in
                defer { group.leave() }

                switch result {
                case .success(let response):
                    do {
                        
                        let data = try JSONDecoder().decode(Forecast.self, from: response.data)
                        results[city.name] = data
                    } catch {
                        print("JSON Decode 錯誤：\(city.name)")
                    }
                case .failure(let error):
                    print("API 請求失敗：\(city.name) - \(error.localizedDescription)")
                }
            }
        }

        group.notify(queue: .main) {
            completion(results)
        }
    }
}
