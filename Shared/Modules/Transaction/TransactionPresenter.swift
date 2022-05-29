//
//  TransactionPresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI

protocol TransactionPresenterProtocol {
    var interactor: TransactionInteractor { get }
    
    var transactions: [Transaction] { get }
}

final class TransactionPresenter: TransactionPresenterProtocol, ObservableObject {
    internal let interactor: TransactionInteractor
    
    let appState = AppState.shared
    
    let transactions: [Transaction] = Array(1...4).map { i in
        Transaction(
            id: i,
            product:  Product(
                id: 1,
                images: ["mie"],
                name: "Indomie Goreng",
                price: 30000,
                discount: 50,
                stock: 250,
                totalSold: 750,
                rating: 5.0
            ),
            quantity: i == 1 ? 3 : 1,
            status: .done,
            rating: i == 1 ? nil : 5.0,
            delivery: Delivery(
                trackingID: "00122039122",
                courier: "Sicepat",
                price: 20000,
                trackings: []
            ),
            paymentMethod: "iFoodPay",
            paidAt: "2022-05-01T12:00:00".convertToDate()
        )
    }

    init(interactor: TransactionInteractor) {
        self.interactor = interactor
    }
}
