//
//  BottomNavigationView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var presenter: AppPresenter
        
    var body: some View {
        TabView(selection: $presenter.appState.bottomNavigation.animation()) {
            ForEach(Navigation.NAVIGATION_ITEMS, id: \.name) { item in
                    item.view
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(item.name)
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .navigationTitle("")
        .navigationBarHidden(true)
        .safeAreaInset(edge: .bottom) {
            BottomNavigation(
                selection: $presenter.appState.bottomNavigation,
                items: Navigation.NAVIGATION_ITEMS
            )
            .navigationTitle(presenter.appState.bottomNavigation)
            .navigationBarHidden(true)
            .navBarTitle(presenter.appState.bottomNavigation)
            .navBarBackButtonHidden(true)
            .navBarHidden(["Home", "Profile"].contains(presenter.appState.bottomNavigation))
        }
    }
}


struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(
            presenter: AppPresenter(
                interactor: AppInteractor()
            )
        )
    }
}
