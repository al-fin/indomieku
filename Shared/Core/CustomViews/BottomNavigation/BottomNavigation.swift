//
//  BottomNavigation.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 16/05/22.
//

import SwiftUI

struct BottomNavigation: View {
    var selection: Binding<String>
    var items: [NavItem]
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
            VStack {
                HStack(spacing: 0) {
                    ForEach(items, id: \.label) { item in
                        BottomNavigationItem(
                            item: item,
                            selection: selection
                        )
                    }
                }
                .frame(height: 64)
                .padding(.horizontal, 0.1)
            }
            .frame(maxWidth: .infinity)
            .background(Color.systemBackground)
            .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: -2)
            .if(colorScheme == .dark) { view in
                view.border(width: 1, edges: [.top], color: Color.label.opacity(0.15))
            }
    }
}


struct BottomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        @State var selection = "Home"
        
        return VStack {
            Spacer()
            
            BottomNavigation(
                selection: $selection,
                items: [
                    NavItem(label: "Home", icon: "house"),
                    NavItem(label: "Keranjang", icon: "house"),
                    NavItem(label: "Notifikasi", icon: "house"),
                    NavItem(label: "Transaksi", icon: "house"),
                    NavItem(label: "Profile", icon: "house")
                ]
            )
        }
    }
}
