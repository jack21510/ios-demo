//
//  LoginView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("登入")
                .font(.largeTitle)
                .bold()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.top, 30)
            
            TextField("帳號", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.top, 30)

            SecureField("密碼", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
                authViewModel.login(username: username, password: password)
            }) {
                Text("登入")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            GoogleSignInButton(action: handleSignInButton)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, 60)
    }
    
    func handleSignInButton() {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first
                  as? UIWindowScene)?.windows.first?.rootViewController
              else {return}
        
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: presentingViewController) { signInResult, error in
                guard let result = signInResult else {
                    // Inspect error
                    return
                }
                
                let profile = signInResult.profile
                print("👤 使用者名稱: \(profile?.name ?? "未知")")
                print("📧 Email: \(profile?.email ?? "未知")")
                print("🖼️ 頭像網址: \(profile?.imageURL(withDimension: 100)?.absoluteString ?? "無")")

                let idToken = user.authentication.idToken
                let accessToken = user.authentication.accessToken

                print("🪪 ID Token: \(idToken ?? "無")")
                print("🔑 Access Token: \(accessToken)")
                // If sign in succeeded, display the app's main content View.
            }
    }
}




#Preview {
    LoginView()
}
