//
//  ContentView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        Group {
            if authViewModel.isLoggedIn {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    RootView()
}
