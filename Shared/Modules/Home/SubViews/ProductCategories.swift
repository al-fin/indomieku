//
//  ProductCategories.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct ProductCategories: View {
    var categories: [ProductCategory]
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(categories, id: \.name) { item in
                VStack(spacing: 5) {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 5)
                    
                    Text(item.name)
                        .font(.system(size: 9, weight: .semibold))
                        .foregroundColor(.label)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}
