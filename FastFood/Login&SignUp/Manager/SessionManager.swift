//
//  SessionManager.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 26/06/25.
//

import Foundation

class SessionManager {
    static let shared = SessionManager()

    func saveLoginState(_ isLoggedIn: Bool) {
        UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
    }

    func isLoggedIn() -> Bool {
        UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

    func logout() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }
}
