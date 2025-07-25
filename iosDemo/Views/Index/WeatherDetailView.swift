//
//  WeatherDetailView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/25.
//

import SwiftUI

struct WeatherDetailView: View {
    let city: CityWeather

    var body: some View {
        VStack(spacing: 16) {
            LottieView(animationName: city.animationName)
                .frame(height: 150)
                .padding()

            Text(city.cityName)
                .font(.largeTitle)
                .bold()

            Text("溫度：\(city.temperature)")
                .font(.title2)

            Text("時間：\(formattedTime(date: city.time))")
                .font(.subheadline)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle("天氣詳情")
    }

}
