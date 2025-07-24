//
//  WeatherCard.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/23.
//

import SwiftUI

struct WeatherCard: View {
    let city: String
    let temperature: String
    let time: String
    let animationName: String
    
    var body: some View {
        ZStack {
            LottieView(animationName: animationName)
                .ignoresSafeArea()
                .frame(height: 120, alignment: .leading)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .opacity(0.4) // 調整透明度讓文字更清楚

            VStack(alignment: .leading, spacing: 8) {
                Text(city)
                    .font(.headline)
                Text("溫度：\(temperature)")
                Text("時間：\(time)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(.systemGray6).opacity(0.5)) // 覆蓋一層卡片色
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        .frame(height: 120)
    }
}

//#Preview {
//    WeatherCard(city: "123", temperature: "22.1", time: "aaa")
//}
