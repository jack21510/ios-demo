//
//  WeatherDetailView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/25.
//

import SwiftUI

struct WeatherDetailView: View {
    let cityName: String
    let temperature: String
    let time: String
    let animationName: String

    var body: some View {
        VStack(spacing: 16) {
            LottieView(animationName: animationName)
                .frame(height: 150)
                .padding()

            Text(cityName)
                .font(.largeTitle)
                .bold()

            Text("溫度：\(temperature)")
                .font(.title2)

            Text("時間：\(formattedTime(date: time))")
                .font(.subheadline)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle("天氣詳情")
    }

}
