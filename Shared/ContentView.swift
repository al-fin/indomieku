//
//  ContentView.swift
//  Shared
//
//  Created by Alfin on 10/05/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appState = AppState.shared
    
    var body: some View {
        VStack {
            if appState.isAuthenticated {
                NavView {
                    BottomNavigationView(
                        presenter: BottomNavigationPresenter(
                            interactor: BottomNavigationInteractor()
                        )
                    )
                }
                .transition(.slide)
            } else {
                LoginView(
                    presenter: LoginPresenter(
                        interactor: LoginInteractor()
                    )
                )
                .transition(.slide)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
