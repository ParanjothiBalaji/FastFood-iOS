//
//  AppTheme.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 26/06/25.
//


import SwiftUI

struct AppTheme {
    static let mainGradient = LinearGradient(
        gradient: Gradient(colors: [Color.orange, Color.yellow]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let buttonGradient = LinearGradient(
        colors: [Color.orange, Color.red],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let homeGradient = LinearGradient(
        colors: [Color.white, Color.green],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
