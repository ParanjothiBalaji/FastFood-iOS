//
//  AuthViewModel.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 26/06/25.
//


import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginError: String?
    
    func login() {
        guard !username.isEmpty, !password.isEmpty else {
            loginError = "Username and password are required."
            return
        }
        
        // Get saved credentials
        let savedEmail = UserDefaults.standard.string(forKey: "user_email")
        let savedPassword = UserDefaults.standard.string(forKey: "user_password")
        
        if username == savedEmail && password == savedPassword {
            isLoggedIn = true
            loginError = nil
            SessionManager.shared.saveLoginState(true)
            print("✅ Login successful")
        } else {
            loginError = "Invalid email or password."
            isLoggedIn = false
        }
    }
    
    func logout() {
            isLoggedIn = false
            username = ""
            password = ""
            SessionManager.shared.logout()
    }
    
    func loadLoginState() {
            isLoggedIn = SessionManager.shared.isLoggedIn()
        }
}

