//
//  CardRow.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 23/05/22.
//

import SwiftUI

struct CartRow: View {
    var cart: Binding<Cart>
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(cart.wrappedValue.product.images[0])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(cart.wrappedValue.product.name)
                            .font(.body.weight(.bold))
                            .foregroundColor(.label)
                    }
                    
                    Spacer()
                    
                    CheckBox(checked: cart.checked)
                }
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        if cart.wrappedValue.product.discount > 0 {
                            Text("\(Int(cart.wrappedValue.product.discount))%")
                                .font(.caption.weight(.regular))
                                .foregroundColor(.accentColor)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .background(Color.accentColor.opacity(0.15))
                                .cornerRadius(15)
                                .border(width: 1, cornerRadius: 15, color: Color.accentColor.opacity(0.5))
                        }
                        
                        if cart.wrappedValue.product.discount > 0 {
                            Text(cart.wrappedValue.product.price.formattedCurrency)
                                .font(.caption.weight(.light))
                                .foregroundColor(.secondaryLabel)
                                .strikethrough(color: .secondaryLabel)
                        }
                        
                        Text(
                            (cart.wrappedValue.product.price - (cart.wrappedValue.product.price * (cart.wrappedValue.product.discount/100.0)))
                                .formattedCurrency
                        )
                        .font(.body.weight(.bold))
                        .foregroundColor(.accentColor)
                        
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 5) {
                        Spacer()
                        
                        Button("-") {
                            cart.wrappedValue.quantity -= 1
                        }
                        .buttonStyle(AccentButton(size: .small))
                        .disabled(cart.wrappedValue.quantity == 1)
                        
                        TextField("", value: cart.quantity, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .padding(5)
                            .frame(width: 40)
                            .border(width: 1, cornerRadius: 8, color: .tertiaryLabel)
                            .font(.caption.weight(.regular))
                            .foregroundColor(.label)
                            .multilineTextAlignment(.center)
                        
                        Button("+") {
                            cart.wrappedValue.quantity += 1
                        }
                        .buttonStyle(AccentButton(size: .small))
                    }
                }
                .foregroundColor(.tertiaryLabel)
            }
        }
        .padding()
        .background(Color.secondarySystemBackground)
        .shadow(color: Color.black.opacity(0.075), radius: 4, x: 0, y: 2)
        .if(colorScheme == .dark) { view in
            view.border(width: 1, edges: [.bottom], color: Color.label.opacity(0.15))
        }
    }
}
