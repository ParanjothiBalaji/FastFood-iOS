//
//  FoodViewModel.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 27/06/25.
//

import Foundation


class FoodViewModel: ObservableObject {
    @Published var foodItems: [FoodItem] = []
    @Published var cartItems: [FoodItem] = []

    private let foodManager = FoodManager()

    init() {
        loadItems()
    }

    func loadItems() {
        self.foodItems = foodManager.fetchFoodItems()
    }

    func addToCart(_ item: FoodItem) {
        if !cartItems.contains(where: { $0.id == item.id }) {
            cartItems.append(item)
        }
    }

    func isInCart(_ item: FoodItem) -> Bool {
        cartItems.contains(where: { $0.id == item.id })
    }
}
