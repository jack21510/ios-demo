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
                        NavigationLink {
                            WeatherDetailView(city: city)
                        } label : {
                            WeatherCard(city: city)
                        }
                        .buttonStyle(PlainButtonStyle())
//
//                        NavigationLink(destination: WeatherDetailView(city: city)) {
//                            WeatherCard(city: city)
//                        }
//                        .buttonStyle(PlainButtonStyle())
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
