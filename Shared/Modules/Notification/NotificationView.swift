//
//  NotificationView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var presenter: NotificationPresenter
    
    var body: some View {
        List {
            ForEach(presenter.notifications, id: \.id) { notification in
                NotificationRow(
                    notification: notification
                )
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
            .listRowBackground(Color.secondarySystemBackground)
        }
        .listStyle(PlainListStyle())
        .navBarTitle("Notifikasi")
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(
            presenter: NotificationPresenter(
                interactor: NotificationInteractor()
            )
        )
    }
}
