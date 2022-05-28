//
//  Delivery.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//

import Foundation

extension DeliveryTracking {
    var icon: String {
        switch type {
        case .paid:
            return "icon.wallet_outlined"
        case .cooking:
            return "icon.cooking_outlined"
        case .shipped:
            return "icon.delivery_outlined"
        case .done:
            return "icon.box_check_outlined"
        }
    }
    
    var description: String {
        switch type {
        case .paid:
            return "Pembayaran diterima."
        case .cooking:
            return "Pesanan sedang dimasak."
        case .shipped:
            return "Pesanan sedang dikirim."
        case .done:
            return "Pesanan sudah sampai."
        }
    }
}
