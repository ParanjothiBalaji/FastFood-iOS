

//
//  LoginView.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 26/06/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var showSignup = false

    var body: some View {
        NavigationView {
            ZStack {
                // 🔵 Background Gradient
                AppTheme.mainGradient.ignoresSafeArea()

                VStack(spacing: 28) {
                    // 🍔 App Logo
                    AppLogo()

                    // 👋 Welcome Title
                    Text("Hi, 👋 Welcome")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    // ✨ App Tagline
                    Text("Order your favorite meals in just a few taps.\nFresh, fast, and at your doorstep!")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.85))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                    // 📝 Login Form
                    VStack(spacing: 16) {
                        TextField("Email", text: $viewModel.username)
                            .textFieldStyle(RoundedFieldStyle())

                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(RoundedFieldStyle())

                        if let error = viewModel.loginError {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.caption)
                        }

                        // 🔓 Login Button
                        Button("Login") {
                            viewModel.login()
                        }
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .buttonStyle(GradientButtonStyle())

                        // ➕ Sign Up Link
                        Button(action: {
                            showSignup = true
                        }) {
                            Text("New user? Create Account")
                                .underline()
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                        }
                        .padding(.top, 4)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .padding(.horizontal, 30)
                }

                // 🔁 Navigate to Sign Up
                NavigationLink(
                    destination: SignupView().environmentObject(viewModel),
                    isActive: $showSignup
                ) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
