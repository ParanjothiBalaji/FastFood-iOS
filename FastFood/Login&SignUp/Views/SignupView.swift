////
////  SignupView.swift
////  FastFood
////
////  Created by Paranjothi Balaji on 26/06/25.
////
//
//


import SwiftUI

struct SignupView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject private var viewModel = SignupViewModel()

    var body: some View {
        ZStack {
            AppTheme.mainGradient.ignoresSafeArea()

            VStack(spacing: 30) {
                AppLogo()

                Text("Create Account")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                VStack(spacing: 16) {
                    CustomTextField(placeholder: "Name", text: $viewModel.name)
                    CustomTextField(placeholder: "Email", text: $viewModel.email)
                    SecureCustomField(placeholder: "Password", text: $viewModel.password)
                    SecureCustomField(placeholder: "Confirm Password", text: $viewModel.confirmPassword)

                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                    }

                    Button("Sign Up") {
                        viewModel.signUp()
                        if viewModel.isSignedUp {
                            authVM.isLoggedIn = true
                            SessionManager.shared.saveLoginState(true)
                        }
                    }
                    .buttonStyle(GradientButtonStyle())
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding(.horizontal, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
