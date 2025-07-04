//
//  FastFoodApp.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 26/06/25.
//

import SwiftUI

@main
struct FastFoodApp: App {
 
   @StateObject private var authVM = AuthViewModel()


    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    if authVM.isLoggedIn {
                        HomeView(viewModel: authVM)
                    } else {
                        LoginView(viewModel: authVM)
                    }
                }
                .onAppear {
                    authVM.loadLoginState()
                }
            }
            .environmentObject(authVM)
        }
    }
}

