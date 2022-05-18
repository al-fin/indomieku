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
    var namespace: Namespace.ID
    
    var body: some View {
        let isActive = selection.wrappedValue == item.name
        
        return ZStack {
            if isActive {
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.accentColor.opacity(0), Color.accentColor.opacity(0.15)]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .border(width: 2, edges: [.bottom], color: Color.accentColor)
                .matchedGeometryEffect(id: "BOTTOM_NAVIGATION", in: namespace)
            }
            
            VStack {
                Image(item.icon)
                    .renderingMode(.template)
                    .font(.system(size: 24))
                Spacer()
                    .frame(height: 2)
                Text("\(item.name)")
                    .font(.caption2.weight(.semibold))
            }
            .foregroundColor(isActive ? Color.accentColor : Color.tertiaryLabel)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .onTapGesture {
                withAnimation(.spring()) {
                    selection.wrappedValue = item.name
                }
            }
        }
    }
}
