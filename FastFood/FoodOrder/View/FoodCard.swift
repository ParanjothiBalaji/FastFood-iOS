////
////  FoodCard.swift
////  FastFood
////
////  Created by Paranjothi Balaji on 27/06/25.
////
//
import SwiftUICore
import SwiftUI

struct FoodCard: View {
    let item: FoodItem
    @ObservedObject var viewModel: FoodViewModel

    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: item.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(height: 120)
            .frame(maxWidth: .infinity)
            .clipped()
            .cornerRadius(12)

            Text(item.name)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

            Text("₹\(Int(item.price))")
                .font(.subheadline)
                .foregroundColor(.red)

            Button(action: {
                viewModel.addToCart(item)
            }) {
                Text(viewModel.isInCart(item) ? "✅ Added" : "🛒 Add to Cart")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(viewModel.isInCart(item) ? Color.green : Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(viewModel.isInCart(item))
        }
        .padding()
        .background(
            LinearGradient(colors: [.red, .white], startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}
