//
//  Button.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 14/05/22.
//

import SwiftUI

enum ButtonSize: String {
    case small, normal
}

struct AccentButton: ButtonStyle {
    var size: ButtonSize
    
    init(size: ButtonSize = .normal) {
        self.size = size
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(size == .small ? .caption.weight(.bold) : .body.weight(.bold))
            .padding(.vertical, size == .small ? 6 : 9)
            .padding(.horizontal, size == .small ? 12 : 15)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color(hex: 0xFF8E8E), Color(hex: 0xF85D5D)]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .foregroundColor(Color.secondarySystemBackground)
            .cornerRadius(8)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

struct SecondaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline.weight(.bold))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.secondaryColor)
            .foregroundColor(Color.accentColor)
            .cornerRadius(12)
            .opacity(configuration.isPressed ? 0.5 : 1)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

struct GlassButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline.weight(.semibold))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.15))
            .foregroundColor(.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.5), lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.5 : 1)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}
