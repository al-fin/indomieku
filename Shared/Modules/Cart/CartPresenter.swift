//
//  CartPresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI
import Combine

protocol CartPresenterProtocol {
    var interactor: CartInteractor { get }
        
    var carts: [Cart] { get }
    var checkedAll: Bool { get }
    
    func handleDelete(at offsets: IndexSet) -> Void
}

final class CartPresenter: CartPresenterProtocol, ObservableObject {
    internal let interactor: CartInteractor
    internal var cancellables = Set<AnyCancellable>()

    let appState = AppState.shared
    
    @Published var carts: [Cart] = Array(1...3).map { i in
        Cart(
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
            quantity: 1,
            checked: false
        )
    }
    
    @Published var checkedAll: Bool = false

    init(interactor: CartInteractor) {
        self.interactor = interactor
        
        $carts
            .sink(receiveValue: { [weak self] _carts in
                let _checkedCarts = _carts.filter { $0.checked }
                
                if _checkedCarts.count == _carts.count && self?.checkedAll == false {
                    self?.checkedAll = true
                } else if _checkedCarts.count != _carts.count && self?.checkedAll == true {
                    self?.checkedAll = false
                }
            })
            .store(in: &cancellables)
    }
    
    func handleCheckAll() {
        if checkedAll == true {
            carts = carts.map { value -> Cart in
                var cart: Cart = value
                cart.checked = true
                return cart
            }
        } else {
            carts = carts.map { value -> Cart in
                var cart: Cart = value
                cart.checked = false
                return cart
            }
        }
    }
    
    func handleDelete(at offsets: IndexSet) -> Void {
        carts.remove(atOffsets: offsets)
    }
}
