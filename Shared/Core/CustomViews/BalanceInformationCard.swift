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
    
    var showButtons: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Image("icon.wallet")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                
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
            
            if showButtons {
                Divider()
                    .background(Color.tertiaryLabel)
                
                HStack(spacing: 25) {
                    VStack {
                        Image("icon.deposit")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                        
                        Text("Deposit")
                            .font(.caption.weight(.semibold))
                            .foregroundColor(Color.accentColor)
                    }
                    
                    Divider()
                        .background(Color.tertiaryLabel)
                    
                    VStack {
                        Image("icon.withdraw")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                        
                        Text("Tarik Saldo")
                            .font(.caption.weight(.semibold))
                            .foregroundColor(Color.accentColor)
                    }
                    
                    Divider()
                        .background(Color.tertiaryLabel)
                    
                    VStack {
                        Image("icon.history")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                        
                        Text("Riwayat")
                            .font(.caption.weight(.semibold))
                            .foregroundColor(Color.accentColor)
                    }
                }
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
