//
//  HomePresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI

protocol HomePresenterProtocol {
    var interactor: HomeInteractor { get }
    
    var keyword: String { get }
    var categories: [ProductCategory] { get }
    var banners: [String] { get }
}

final class HomePresenter: HomePresenterProtocol, ObservableObject {
    internal let interactor: HomeInteractor
    
    let appState = AppState.shared
    
    let products: [Product] = Array(1...5).map { i in
        Product(
            id: i,
            images: ["mie"],
            name: "Indomie Goreng",
            price: 30000,
            discount: 50,
            stock: 250,
            totalSold: 750,
            rating: 5.0
        )
    }
    
    let categories: [ProductCategory] = [
        ProductCategory(name: "Ayam Geprek", image: "1-indomie"),
        ProductCategory(name: "Original", image: "2-indomie"),
        ProductCategory(name: "Rendang", image: "3-indomie"),
        ProductCategory(name: "Soto", image: "4-indomie"),
        ProductCategory(name: "Ayam Bawang", image: "5-indomie"),
        ProductCategory(name: "Mie Aceh", image: "6-indomie"),
        ProductCategory(name: "Pedas", image: "7-indomie"),
        ProductCategory(name: "Kari Ayam", image: "8-indomie"),
        ProductCategory(name: "Seblak", image: "9-indomie"),
        ProductCategory(name: "Cabe Ijo", image: "10-indomie"),
    ]
    
    let banners: [String] = Array(1...5).map { "\($0)-banner" }
    
    @Published internal var keyword = ""

    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }
}
