//
//  HomeView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        BaseNavigationView(title: "首頁") {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<20) { i in
                        NavigationLink(destination: Text("詳細頁 \(i)")) {
                            Text("點我前往第 \(i) 頁")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }
        }
    }
    
}

#Preview {
    HomeView()
}
