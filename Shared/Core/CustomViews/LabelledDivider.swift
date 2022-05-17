//
//  LabelledDivider.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 14/05/22.
//

import SwiftUI

struct LabelledDivider: View {
    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(_ label: String, horizontalPadding: CGFloat = 0, color: Color = .white) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            Line
            Text(label)
                .lineLimit(1)
                .font(.caption.weight(.light))
                .foregroundColor(color)
                .fixedSize()
            Line
        }
    }

    var Line: some View {
        VStack {
            Rectangle()
                .fill(color)
                .frame(height: 1)
                .opacity(0.5)
        }.padding(horizontalPadding)
    }
}
