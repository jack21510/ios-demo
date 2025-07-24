//
//  APIManager.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//

import Moya

final class APIManager {

    // MARK: - Singleton（可選）
    static let shared = APIManager()
    private init() {}

    private let provider = MoyaProvider<APIService>()

    /// 取得天氣預報
    func fetchForecast(latitude: Double,
                       longitude: Double,
                       hourly: String = "temperature_2m",
                       completion: @escaping (Result<Forecast, Error>) -> Void) {
        provider.request(.forecast(latitude: latitude, longitude: longitude, hourly: hourly)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(Forecast.self, from: response.data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

import Foundation
import Moya

class WeatherManager {
    static let shared = WeatherManager()
    
    private let provider = MoyaProvider<APIService>()
    
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
