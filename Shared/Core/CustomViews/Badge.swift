//
//  Badge.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct Badge: View {
    let count: Int

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.clear
            Text(String(count))
                .font(.system(size: 14).weight(.bold))
                .frame(width: 24, height: 24)
                .foregroundColor(Color(hex: 0xD36602))
                .background(Color.secondaryColor)
                .clipShape(Circle())
                // custom positioning in the top-right corner
                .alignmentGuide(.top) { $0[.bottom] }
                .alignmentGuide(.trailing) { $0[.trailing] - $0.width * 0.25 }
        }
    }
}
