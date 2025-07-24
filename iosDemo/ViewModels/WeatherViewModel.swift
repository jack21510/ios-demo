//
//  WeatherViewModel.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//
import Foundation
import SVProgressHUD

class WeatherViewModel: ObservableObject {
    @Published var cityWeathers: [CityWeather] = []
    @Published var isLoading = false

    func fetchWeather() {
        isLoading = true
        SVProgressHUD.show()
        WeatherManager.shared.fetchWeatherForAllCities { [weak self] data in
            DispatchQueue.main.async {
                self?.cityWeathers = data.compactMap { cityName, forecast in
                    guard
                        let temp = forecast.hourly.temperature_2m.first,
                        let time = forecast.hourly.time.first,
                        let code = forecast.hourly.weathercode.first
                    else {
                        return nil
                    }

                    return CityWeather(
                        cityName: cityName,
                        temperature: String(format: "%.1f℃", temp),
                        time: formattedTime(date: time),
                        weatherCode: code,
                        animationName: WeatherCodeConstants.animationName(for: code)
                    )
                }.sorted(by: { $0.cityName < $1.cityName })

                self?.isLoading = false
                SVProgressHUD.dismiss()
            }
        }
    }
}

