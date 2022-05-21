//
//  ProductCard.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct ProductCard: View {
    var product: Product
    var isFlashSale: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Image(product.images[0])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(Int(Double(product.price) - (Double(product.price) * Double(Double(product.discount)/100.0))).formattedCurrency())
                            .font(.title3.weight(.bold))
                            .foregroundColor(.accentColor)
                        
                        Text(product.price.formattedCurrency())
                            .font(.caption.weight(.light))
                            .foregroundColor(.secondaryLabel)
                            .strikethrough(color: .secondaryLabel)
                    }
                    
                    Spacer()
                    
                    Text("\(product.discount)%")
                        .font(.caption.weight(.regular))
                        .foregroundColor(.accentColor)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color.accentColor.opacity(0.25))
                        .cornerRadius(8)
                        .border(width: 1, cornerRadius: 8, color: Color.accentColor.opacity(0.5))
                }
                
                Text(product.name)
                    .font(.title3.weight(.bold))
                    .foregroundColor(.label)
                
                Spacer()
                
                if isFlashSale {
                    Group {
                        SaleProgress(
                            value: product.totalSold,
                            min: 0,
                            max: product.totalSold + product.stock
                        )
                                                
                        Text("Segera Habis")
                            .font(.caption2.weight(.semibold))
                            .foregroundColor(.accentColor)
                    }
                } else {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.caption.weight(.light))
                            .foregroundColor(.secondaryColor)
                        
                        Text("\(product.rating, specifier: "%.1f")  |  \(product.totalSold) Terjual")
                            .font(.caption.weight(.light))
                            .foregroundColor(.secondaryLabel)
                    }
                }
            }
            .padding()
            .background(Color.secondarySystemBackground)
        }
        .card()
    }
}
