//
//  HomeView.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 26/06/25.
//


import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: AuthViewModel
    @StateObject private var foodViewModel = FoodViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    welcomeHeader

                    CategorySection(title: "🔥 Popular Items", items: foodViewModel.foodItems.shuffled(), viewModel: foodViewModel)
                    CategorySection(title: "🍕 Pizzas", items: foodViewModel.foodItems.filter { $0.name.contains("Pizza") }, viewModel: foodViewModel)
                    CategorySection(title: "🥤 Drinks", items: foodViewModel.foodItems.filter { $0.name.contains("Drinks") }, viewModel: foodViewModel)

                    logoutButton
                }
                .padding(.top)
            }
            .navigationTitle("🍽️ FastFood")
            .background(AppTheme.homeGradient.ignoresSafeArea())
        }
        .navigationBarBackButtonHidden(true)
    }

    private var welcomeHeader: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Welcome")
                .font(.title3)
                .foregroundColor(.black)
            Text(viewModel.username)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(.black)
            Text("Order something delicious today 🍔🍟🥤")
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.85))
        }
        .padding(.horizontal)
    }

    private var logoutButton: some View {
        Button(action: {
            viewModel.logout()
        }) {
            Text("Logout")
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
        }
    }
}
