//
//  SettingView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        VStack(spacing: 0) {
            // 頭像 + 使用者資訊
            VStack(spacing: 8) {
                KFImage(authViewModel.currentUserData?.imageURL)
                .resizable()
                .placeholder {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.top, 32)

                Text(authViewModel.userName ?? "未登入")
                    .font(.title2)
                    .fontWeight(.medium)

                Text(authViewModel.currentUserData?.email ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 24)

            // 分隔線
            Divider()

            // 清單內容
            List {
                Section {
                    NavigationLink(destination: Text("編輯個人資料")) {
                        Label("編輯個人資料", systemImage: "pencil")
                    }

                    NavigationLink(destination: Text("通知設定")) {
                        Label("通知設定", systemImage: "bell")
                    }

                    NavigationLink(destination: Text("偏好設定")) {
                        Label("偏好設定", systemImage: "gear")
                    }
                }

                // 登出按鈕放在最底部
                Section {
                    Button(action: {
                        authViewModel.logout()
                    }) {
                        Label("登出", systemImage: "arrow.backward.circle.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(.insetGrouped)

        }
        .navigationTitle("個人資料")
    }
}



//#Preview {
//    SettingView()
//}
