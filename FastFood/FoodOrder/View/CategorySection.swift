//
//  CategorySection.swift
//  FastFood
//
//  Created by Paranjothi Balaji on 27/06/25.
//

import SwiftUICore
import SwiftUI


struct CategorySection: View {
    let title: String
    let items: [FoodItem]
    @ObservedObject var viewModel: FoodViewModel  // ✅ Add this

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(items) { item in
                        FoodCard(item: item, viewModel: viewModel)
                            .frame(width: 200)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}
