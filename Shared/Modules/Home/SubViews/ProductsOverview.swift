//
//  ProductsOverview.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct ProductsOverview: View {
    var title: String
    var products: [Product]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(title)
                    .font(.title2.weight(.bold))
                    .foregroundColor(.label)
                
                Spacer()
                
                Group {
                    Text("Selengkapnya")
                    Image(systemName: "arrow.forward")
                }
                .font(.body.weight(.bold))
                .foregroundColor(.accentColor)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<products.count) { i in
                        ProductCard(
                            product: products[i],
                            isFlashSale: false
                        )
                        .padding(.leading, i == 0 ? nil : 0)
                        .padding(.trailing, nil)
                    }
                }
                .padding(.bottom)
            }
            .padding(.vertical)
        }
        .padding(.vertical)
    }
}
