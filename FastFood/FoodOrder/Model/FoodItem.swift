//
//  FoodItem.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 27/06/25.
//

import Foundation


struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
    let price: Double
}
