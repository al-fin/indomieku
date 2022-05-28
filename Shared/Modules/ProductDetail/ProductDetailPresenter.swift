//
//  ProductDetailPresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//


import Foundation
import SwiftUI

protocol ProductDetailPresenterProtocol {
    var interactor: ProductDetailInteractor { get }
    
    var product: Product { get }
    var reviews: [Review] { get }
}

final class ProductDetailPresenter: ProductDetailPresenterProtocol, ObservableObject {
    internal let interactor: ProductDetailInteractor
    
    let appState = AppState.shared
    
    let product: Product = Product(
        id: 1,
        images: ["mie"],
        name: "Indomie Goreng",
        description: "Indomie is a brand of instant noodle produced by the Indonesian company Indofood. Indofood itself is the largest instant noodle producer in the world with 16 factories. Over 15 billion packets of Indomie are produced annually. Indomie is also exported to more than 90 countries around the world.",
        price: 30000,
        discount: 50,
        stock: 250,
        totalSold: 750,
        rating: 5.0
    )
    
    let reviews: [Review] = Array(0..<4).map { i in
        Review(
            user: User(
                id: 1,
                avatar: "avatar",
                userID: "001223848815",
                name: "Chelsea Islan",
                email: "chelsea.islan@icloud.com",
                phone: "08122378282",
                address: "Jl. Andara Raya, Pangkalan Jati Baru, Kec. Cinere, Cinere, Jakarta Selatan, DKI Jakarta 1245"
            ),
            content: "Rasanya tidak berubah sedari dulu, bumbunya gurih dan agak manis. Pangsit gorengnya enak.",
            rating: 5.0,
            date: "2022-05-01T12:00:00".convertToDate()
        )
    }

    init(interactor: ProductDetailInteractor) {
        self.interactor = interactor
    }
}
