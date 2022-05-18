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
    @Namespace private var bottomNavigationNamespace
    
    var body: some View {
            VStack {
                HStack(spacing: 0) {
                    ForEach(items, id: \.name) { item in
                        BottomNavigationItem(
                            item: item,
                            selection: selection,
                            namespace: bottomNavigationNamespace
                        )
                        .frame(maxWidth: 100)
                    }
                 }
                .frame(height: 64)
            }
            .frame(maxWidth: .infinity)
            .background(Color.secondarySystemBackground)
            .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: 0)
            .if(colorScheme == .dark) { view in
                view.border(width: 1, edges: [.top], color: Color.label.opacity(0.15))
            }
    }
}


struct BottomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        @State var selection = "Home"
        let bottomNavigationItems: [NavItem] = [
            NavItem(
                name: "Home",
                icon: "icon.home",
                view: AnyView(Color.systemBackground)
            ),
            NavItem(
                name: "Keranjang",
                icon: "icon.cart",
                view: AnyView(Color.systemBackground)
            ),
            NavItem(
                name: "Notifikasi",
                icon: "icon.notification",
                view: AnyView(Color.systemBackground)
            ),
            NavItem(
                name: "Transaksi",
                icon: "icon.transaction",
                view: AnyView(Color.systemBackground)
            ),
            NavItem(
                name: "Profile",
                icon: "icon.profile",
                view: AnyView(Color.systemBackground)
            )
        ]
        
        return VStack {
            Spacer()
            
            BottomNavigation(
                selection: $selection,
                items: bottomNavigationItems
            )
        }
    }
}
