//
//  TransactionDetailPresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//


import Foundation
import SwiftUI

protocol TransactionDetailPresenterProtocol {
    var interactor: TransactionDetailInteractor { get }
    
    var transaction: Transaction { get }
}

final class TransactionDetailPresenter: TransactionDetailPresenterProtocol, ObservableObject {
    internal let interactor: TransactionDetailInteractor
    
    let appState = AppState.shared
    
    let transaction: Transaction = Transaction(
        id: 1,
        product:  Product(
            id: 1,
            images: ["mie"],
            name: "Indomie Goreng",
            description: "Indomie is a brand of instant noodle produced by the Indonesian company Indofood. Indofood itself is the largest instant noodle producer in the world with 16 factories. Over 15 billion packets of Indomie are produced annually. Indomie is also exported to more than 90 countries around the world.",
            price: 30000,
            discount: 50,
            stock: 250,
            totalSold: 750,
            rating: 5.0
        ),
        quantity: 3,
        status: .done,
        rating: 5.0,
        delivery: Delivery(
            trackingID: "00122039122",
            courier: "Sicepat",
            price: 20000,
            tracking: []
        ),
        paymentMethod: "iFoodPay",
        paidAt: "2022-05-01T12:00:00".convertToDate()
    )
    
    init(interactor: TransactionDetailInteractor) {
        self.interactor = interactor
    }
}
