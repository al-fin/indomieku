//
//  ProductInformation.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//

import SwiftUI


struct ProductInformation: View {
    var transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Info Produk")
                .font(.body.weight(.semibold))
                .foregroundColor(.accentColor)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Nama")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.label)
                    
                    Text(transaction.product.name)
                        .font(.body.weight(.light))
                        .foregroundColor(.secondaryLabel)
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Qty")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.label)
                    
                    Text("\(transaction.quantity)")
                        .font(.body.weight(.light))
                        .foregroundColor(.secondaryLabel)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Total Harga")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.label)
                    
                    Text(transaction.totalPrice.formattedCurrency)
                        .font(.body.weight(.light))
                        .foregroundColor(.secondaryLabel)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Deskripsi")
                    .font(.body.weight(.semibold))
                    .foregroundColor(.label)
                
                Text(transaction.product.description)
                    .font(.body.weight(.light))
                    .foregroundColor(.secondaryLabel)
            }
        }
    }
}


