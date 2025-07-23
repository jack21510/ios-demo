//
//  WeatherViewModel.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//
import Foundation

struct CityWeather: Identifiable {
    let id = UUID()
    let cityName: String
    let temperature: String
    let time: String
}

class WeatherViewModel: ObservableObject {
    @Published var cityWeathers: [CityWeather] = []
    @Published var isLoading = false

    func fetchWeather() {
        isLoading = true
        WeatherManager.shared.fetchWeatherForAllCities { [weak self] data in
            DispatchQueue.main.async {
                self?.cityWeathers = data.compactMap { cityName, forecast in
                    guard let temp = forecast.hourly.temperature_2m.first,
                          let time = forecast.hourly.time.first else { return nil }

                    return CityWeather(
                        cityName: cityName,
                        temperature: String(format: "%.1f℃", temp),
                        time: time
                    )
                }.sorted(by: { $0.cityName < $1.cityName })

                self?.isLoading = false
            }
        }
    }
}

