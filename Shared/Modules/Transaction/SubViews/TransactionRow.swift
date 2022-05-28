//
//  TransactionRow.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 25/05/22.
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        ZStack {
            NavLink(destination: TransactionDetailView(
                presenter: TransactionDetailPresenter(
                    interactor: TransactionDetailInteractor()
                )
            )) {
                EmptyView()
            }
            .opacity(0)
            
            HStack(alignment: .top, spacing: 10) {
                Image(transaction.product.images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(transaction.product.name)
                                .font(.body.weight(.bold))
                                .foregroundColor(.label)
                            
                            Text("\(transaction.quantity) Porsi")
                                .font(.caption.weight(.light))
                                .foregroundColor(.secondaryLabel)
                        }
                        
                        Spacer()
                        
                        Text("\(transaction.status.label)")
                            .font(.caption.weight(.bold))
                            .foregroundColor(transaction.status.color)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(transaction.status.color.opacity(0.15))
                            .cornerRadius(8)
                            .border(width: 1, cornerRadius: 8, color: transaction.status.color.opacity(0.5))
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text("Total Harga")
                                .font(.caption.weight(.light))
                                .foregroundColor(.secondaryLabel)
                            
                            Text(transaction.totalPrice.formattedCurrency)
                                .font(.body.weight(.bold))
                                .foregroundColor(.label)
                        }
                        
                        Spacer()
                        
                        if transaction.rating != nil {
                            Rating(transaction.rating!)
                        } else {
                            Button("Beri Ulasan", action: {})
                                .buttonStyle(AccentButton(size: .small))
                        }
                    }
                    .foregroundColor(.tertiaryLabel)
                }
            }
            .padding()
            .border(width: 1, edges: [.bottom], color: Color.label.opacity(0.15))
        }
    }
}
