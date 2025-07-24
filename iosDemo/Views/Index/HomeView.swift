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
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.cityWeathers) { city in
                        NavigationLink(destination: WeatherDetailView(
                            cityName: city.cityName,
                            temperature: city.temperature,
                            time: city.time,
                            animationName: city.animationName
                        )) {
                            WeatherCard(
                                city: city.cityName,
                                temperature: city.temperature,
                                time: city.time,
                                animationName: city.animationName
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            .onAppear {
                viewModel.fetchWeather()
            }
        }
    }
    
}

//#Preview {
//    HomeView()
//}
