//
//  RoundedFieldStyle.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 26/06/25.
//


import SwiftUI

struct RoundedFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .background(Color.white.opacity(0.2))
            .cornerRadius(12)
            .foregroundColor(.white)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.3)))
    }
}
