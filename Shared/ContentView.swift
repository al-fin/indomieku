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
        NavView {
            VStack {
//                if appState.isAuthenticated {
//                    AppView(
//                        presenter: AppPresenter(
//                            interactor: AppInteractor()
//                        )
//                    )
//                    .transition(.slide)
//                } else {
//                    LoginView(
//                        presenter: LoginPresenter(
//                            interactor: LoginInteractor()
//                        )
//                    )
//                    .transition(.slide)
//                }
                
                TransactionDetailView(
                    presenter: TransactionDetailPresenter(
                        interactor: TransactionDetailInteractor()
                    )
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
