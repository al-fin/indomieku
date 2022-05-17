//
//  HomeView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter

    var body: some View {
        VStack {
            Text("Home")
                .font(.largeTitle)
            
            Button("Logout") {
                presenter.logout()
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            presenter: HomePresenter(
                interactor: HomeInteractor()
            )
        )
    }
}
