//
//  TransactionView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct TransactionView: View {
    @ObservedObject var presenter: TransactionPresenter

    var body: some View {
        List {
            ForEach(presenter.transactions, id: \.id) { transaction in
                TransactionRow(transaction: transaction)
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
            .listRowBackground(Color.secondarySystemBackground)
        }
        .listStyle(PlainListStyle())
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView(
            presenter: TransactionPresenter(
                interactor: TransactionInteractor()
            )
        )
    }
}
