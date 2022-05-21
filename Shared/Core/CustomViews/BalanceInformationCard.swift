//
//  BalanceInformationCard.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI


struct BalanceInformationCard: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: 20) {
            Image("icon.wallet")
                .resizable()
                .scaledToFit()
                .frame(height: 44)
            
            VStack(alignment: .leading) {
                Text("Rp 12,000,000")
                    .font(.title2.weight(.bold))
                    .foregroundColor(.label)
                
                Text("Saldo iFoodPay")
                    .font(.caption.weight(.light))
                    .foregroundColor(.secondaryLabel)
            }
            
            Spacer()
            
            Image(systemName: "eye.slash.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 18)
                .foregroundColor(.tertiaryLabel)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.tertiarySystemBackground.ignoresSafeArea())
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 2)
        .if(colorScheme == .dark) { view in
            view.border(width: 1, cornerRadius: 16, color: Color.label.opacity(0.15))
        }
    }
}
