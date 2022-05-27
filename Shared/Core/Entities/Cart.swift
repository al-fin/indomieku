//
//  Cart.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 23/05/22.
//

import Foundation

struct Cart {
    var id: Int
    var product: Product
    var quantity: Int  {
        didSet {
            if quantity < 1 {
                quantity = 1
            }
        }
    }
    var checked: Bool = false
}
