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
                    .background(Color.primaryColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            GoogleSignInButton(action: {
                authViewModel.signInWithGoogle()
            })
            .padding()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, 60)
    }
    
}



//
//#Preview {
//    LoginView()
//}
