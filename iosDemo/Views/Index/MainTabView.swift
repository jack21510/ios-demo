//
//  MainTabView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("首頁", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("個人", systemImage: "gearshape")
                }
        }
        .tint(.primaryColor)
    }
}

#Preview {
    MainTabView()
}
