//
//  BottomNavigationItem.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 17/05/22.
//

import SwiftUI

struct BottomNavigationItem: View {
    var item: NavItem
    var selection: Binding<String>

    var body: some View {
        let isActive = selection.wrappedValue == item.label

        return VStack {
            Image(item.icon)
                .renderingMode(.template)
                .font(.system(size: 24))
            Spacer()
                .frame(height: 2)
            Text("\(item.label)")
                .font(.caption2.weight(.semibold))
        }
        .foregroundColor(isActive ? Color.accentColor : Color.tertiaryLabel)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .if(isActive) { view in
            view
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color.accentColor.opacity(0), Color.accentColor.opacity(0.15)]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .border(width: 2, edges: [.bottom], color: Color.accentColor)
        }
        .onTapGesture {
            selection.wrappedValue = item.label
        }
    }
}
