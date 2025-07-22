//
//  AuthViewModel.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func login(username: String, password: String) {
        if !username.isEmpty && !password.isEmpty {
            isLoggedIn = true
        }
    }

    func logout() {
        isLoggedIn = false
    }
}

