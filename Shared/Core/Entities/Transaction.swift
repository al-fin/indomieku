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

enum DeliveryTrackingType: String {
    case paid, cooking, shipped, done
}

struct DeliveryTracking {
    var type: DeliveryTrackingType
    var date: Date
}

struct Delivery {
    var trackingID: String
    var courier: String
    var price: Int
    var tracking: [DeliveryTracking]
}

struct Transaction {
    var id: Int
    var product: Product
    var quantity: Int
    var status: TransactionStatus
    var rating: Double?
    var delivery: Delivery
    var paymentMethod: String
    var paidAt: Date
    
    var totalPrice: Int {
        (product.totalPrice * quantity) + delivery.price
    }
}
