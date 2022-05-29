//
//  Product.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import Foundation

struct Product {
    var id: Int
    var images: [String]
    var name: String
    var description: String = ""
    var price: Double
    var discount: Double
    var stock: Int
    var totalSold: Int
    var rating: Double
    
    var totalPrice: Int {
        Int(price - (price * (discount/100.0)))
    }
}
