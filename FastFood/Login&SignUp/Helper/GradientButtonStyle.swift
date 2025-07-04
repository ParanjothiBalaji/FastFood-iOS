//
//  GradientButtonStyle.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 26/06/25.
//


import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(AppTheme.buttonGradient)
            .foregroundColor(.white)
            .cornerRadius(14)
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .shadow(radius: 5)
    }
}
