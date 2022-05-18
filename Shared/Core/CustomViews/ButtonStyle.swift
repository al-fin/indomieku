//
//  Button.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 14/05/22.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
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
