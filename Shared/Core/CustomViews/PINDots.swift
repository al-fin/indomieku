//
//  PINDots.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 14/05/22.
//

import SwiftUI

struct PINDots: View {
    var value: String
    
    let size: CGFloat = 15
    let pinLength = 6
    let activeColor = Color.secondaryColor
    let inactiveColor = Color(hex: 0x000000, alpha: 0.1)
    
    var body: some View {
        HStack {
            ForEach(1...pinLength, id: \.self) { i in
                Circle()
                    .fill(value.count >= i ? activeColor : inactiveColor)
                    .frame(width: size, height: size)
            }
        }
    }
}
