//
//  PaymentInformation.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//

import SwiftUI

struct PaymentInformation: View {
    var transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Info Pembayaran")
                .font(.body.weight(.semibold))
                .foregroundColor(.accentColor)
            
            HStack {
                Text("Metode Pembayaran")
                    .font(.body.weight(.light))
                    .foregroundColor(.secondaryLabel)
                Spacer()
                Text(transaction.paymentMethod)
                    .font(.body.weight(.light))
                    .foregroundColor(.secondaryLabel)
            }
            
            HStack {
                Text("Harga Produk")
                    .font(.body.weight(.light))
                    .foregroundColor(.secondaryLabel)
                Spacer()
                Text(transaction.totalPrice.formattedCurrency)
                    .font(.body.weight(.light))
                    .foregroundColor(.secondaryLabel)
            }
            
            HStack {
                Text("Ongkir")
                    .font(.body.weight(.light))
                    .foregroundColor(.secondaryLabel)
                Spacer()
                Text(transaction.delivery.price.formattedCurrency)
                    .font(.body.weight(.light))
                    .foregroundColor(.secondaryLabel)
            }
            
            Divider().background(Color.tertiaryLabel)
            
            HStack {
                Text("Total Belanja")
                    .font(.body.weight(.bold))
                    .foregroundColor(.label)
                Spacer()
                Text(transaction.totalPrice.formattedCurrency)
                    .font(.body.weight(.bold))
                    .foregroundColor(.label)
            }
        }
    }
}

