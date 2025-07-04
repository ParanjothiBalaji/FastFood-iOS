//
//  SignupViewModel.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 26/06/25.
//


import Foundation
import Combine


class SignupViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage: String?
    @Published var isSignedUp = false

    func signUp() {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "All fields are required."
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }

        // Save credentials to UserDefaults
        UserDefaults.standard.set(email, forKey: "user_email")
        UserDefaults.standard.set(password, forKey: "user_password")

        isSignedUp = true
    }
}

