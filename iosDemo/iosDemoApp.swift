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
            RootView()
                .environmentObject(authViewModel)
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear {
                    authViewModel.restorePreviousSession()
                }
        }
    }
}
