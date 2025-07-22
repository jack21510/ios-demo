//
//  iosDemoApp.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import SwiftUI
import GoogleSignIn

@main
struct iosDemoApp: App {
    
    @StateObject private var authViewModel = AuthViewModel()

        var body: some Scene {
            WindowGroup {
                if authViewModel.isLoggedIn {
                    MainTabView()
                        .environmentObject(authViewModel)
                } else {
                    LoginView()
                        .environmentObject(authViewModel)
                        .onOpenURL { url in
                                GIDSignIn.sharedInstance.handle(url)
                        }
                        .onAppear {
                                GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                                    // Check if `user` exists; otherwise, do something with `error`
                                }
                        }
                }
            }
        }
}
