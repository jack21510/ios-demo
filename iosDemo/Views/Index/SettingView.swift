//
//  SettingView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        BaseNavigationView(title: "設定") {
            VStack {
                Text("設定")
                    .padding()

                Button("登出") {
                    authViewModel.logout()
                }
                .foregroundColor(.red)
                .padding()
            }
        }
    }
}


#Preview {
    SettingView()
}
