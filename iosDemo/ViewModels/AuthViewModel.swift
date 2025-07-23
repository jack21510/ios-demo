//
//  AuthViewModel.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import Foundation
import GoogleSignIn

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var userName: String? = nil

    private let clientID = Bundle.main.object(forInfoDictionaryKey: "CLIENT_ID") as? String

    // ✅ 傳統帳密登入
    func login(username: String, password: String) {
        if !username.isEmpty && !password.isEmpty {
            userName = username
            isLoggedIn = true
            print("帳密登入成功: \(username)")
        } else {
            print("帳號密碼不能為空")
        }
    }

    // ✅ Google 登入
    func signInWithGoogle() {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first
                  as? UIWindowScene)?.windows.first?.rootViewController
              else {return}
        
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: presentingViewController) { user, error in
                guard let result = user else {
                    // Inspect error
                    print("\(#line) \(String(describing: error))")
                    return
                }
                
                print("\(#line) \(result)")
                let profile = result.user.profile
                print("👤 使用者名稱: \(profile?.name ?? "未知")")
                print("📧 Email: \(profile?.email ?? "未知")")
                print("🖼️ 頭像網址: \(profile?.imageURL(withDimension: 100)?.absoluteString ?? "無")")
//
                let idToken = result.user.idToken?.tokenString
                let accessToken = result.user.accessToken

                print("🪪 ID Token: \(idToken ?? "無")")
                print("🔑 Access Token: \(accessToken)")
                // If sign in succeeded, display the app's main content View.
                
                self.userName = profile?.name ?? ""
                self.isLoggedIn = true
            }
    }

    // ✅ Google 自動還原登入
    func restorePreviousSession() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] user, error in
            guard let self = self else { return }

            if let user = user {
                self.userName = user.profile?.name
                self.isLoggedIn = true
                print("還原 Google 登入成功")
            } else {
                print("無法還原登入: \(error?.localizedDescription ?? "未知錯誤")")
            }
        }
    }

    // ✅ 登出（共用）
    func logout() {
        GIDSignIn.sharedInstance.signOut()
        isLoggedIn = false
        userName = nil
        print("登出")
    }
}
