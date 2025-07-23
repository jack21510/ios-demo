//
//  HomeView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        BaseNavigationView(title: "首頁") {
            List(viewModel.cityWeathers) { cityWeather in
                VStack(alignment: .leading) {
                    Text(cityWeather.cityName)
                        .font(.headline)
                    Text("溫度：\(cityWeather.temperature)")
                    Text("時間：\(cityWeather.time)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("台灣天氣")
            .onAppear {
                viewModel.fetchWeather()
            }
        }
    }
    
}

#Preview {
    HomeView()
}
