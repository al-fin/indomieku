//
//  HomeNavBar.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

var cartView: CartView = CartView(
    presenter: CartPresenter(
        interactor: CartInteractor()
    )
)

var notificationView: NotificationView = NotificationView(
    presenter: NotificationPresenter(
        interactor: NotificationInteractor()
    )
)

struct HomeNavBar: View {
    var keyword: Binding<String>
    
    var body: some View {
        HStack(spacing: 10) {
            CustomTextField(
                label: "",
                placeholder: "Cari mie favoritmu di sini...",
                text: keyword,
                startIcon: "icon.search",
                iconSource: .assets
            )
            
            NavLink(
                destination: cartView
            ) {
                Image("icon.cart")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                    .foregroundColor(.tertiarySystemBackground)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .overlay(Badge(count: 3))
            }
            
            NavLink(
                destination: notificationView
            ) {
                Image("icon.notification")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                    .foregroundColor(.tertiarySystemBackground)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
        }
    }
}
