//
//  FlashSale.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI


struct FlashSale: View {
    var products: [Product]
    var remainingTime: Date
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Flash Sale")
                        .font(.title3.weight(.bold))
                        .foregroundColor(.accentColor)
                    Text("Kejar diskon spesial!")
                        .font(.caption.weight(.light))
                        .foregroundColor(.label)
                }
                
                Spacer()
                
                Countdown(
                    endDate: remainingTime
                )
            }
            .padding()
            .background(Color.secondarySystemBackground.ignoresSafeArea())
            .if(colorScheme == .dark) { view in
                view.border(width: 1, edges: [.top], color: Color.label.opacity(0.15))
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<products.count) { i in
                        ProductCard(
                            product: products[i],
                            isFlashSale: true
                        )
                        .padding(.leading, i == 0 ? nil : 0)
                        .padding(.trailing, nil)
                    }
                }
            }
            .padding(.vertical)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color(hex: 0xFF9393), Color(hex: 0xF85D5D)]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
        }
        .padding(.vertical)
    }
}
