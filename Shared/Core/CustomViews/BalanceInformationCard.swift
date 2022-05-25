//
//  BalanceInformationCard.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct BalanceInformationCard: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showBalance: Bool = true

    var body: some View {
        HStack(spacing: 20) {
            Image("icon.wallet")
                .resizable()
                .scaledToFit()
                .frame(height: 44)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(showBalance ? "Rp 12,000,000" : "Rp •••••••••••")
                        .font(.title2.weight(.bold))
                        .foregroundColor(.label)
                    
                    Spacer()

                    Image(systemName: showBalance ? "eye.slash.fill" : "eye.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 14)
                        .foregroundColor(.tertiaryLabel)
                        .onTapGesture {
                            showBalance.toggle()
                        }
                }
                
                Text("Saldo iFoodPay")
                    .font(.caption.weight(.light))
                    .foregroundColor(.secondaryLabel)
            }
            
            
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.tertiarySystemBackground.ignoresSafeArea())
        .cornerRadius(16)
        .if(colorScheme != .dark) { view in
            view.shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 2)
        }
        .if(colorScheme == .dark) { view in
            view.border(width: 1, cornerRadius: 16, color: Color.label.opacity(0.15))
        }
    }
}
