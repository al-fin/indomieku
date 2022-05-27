//
//  Transaction.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 22/05/22.
//

import Foundation

enum TransactionStatus: String {
    case waiting_for_payment, paid, cooking, shipped, done, canceled
}

struct Transaction {
    var id: Int
    var product: Product
    var quantity: Int
    var status: TransactionStatus
    var rating: Double?
    
    var totalPrice: Int {
        product.totalPrice * quantity
    }
}
