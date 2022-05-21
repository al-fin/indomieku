//
//  BottomNavigation.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct Navigation {
    static let NAVIGATION_ITEMS: [NavItem] = [
        NavItem(
            name: "Home",
            icon: "icon.home",
            view: AnyView(HomeView(presenter: HomePresenter(interactor: HomeInteractor())))
        ),
        NavItem(
            name: "Keranjang",
            icon: "icon.cart",
            view: AnyView(CartView(presenter: CartPresenter(interactor: CartInteractor())))
        ),
        NavItem(
            name: "Notifikasi",
            icon: "icon.notification",
            view: AnyView(NotificationView(presenter: NotificationPresenter(interactor: NotificationInteractor())))
        ),
        NavItem(
            name: "Transaksi",
            icon: "icon.transaction",
            view: AnyView(TransactionView(presenter: TransactionPresenter(interactor: TransactionInteractor())))
        ),
        NavItem(
            name: "Profile",
            icon: "icon.profile",
            view: AnyView(ProfileView(presenter: ProfilePresenter(interactor: ProfileInteractor())))
        )
    ]
}
