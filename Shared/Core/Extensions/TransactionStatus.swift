//
//  TransactionStatus.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 22/05/22.
//

import SwiftUI

extension TransactionStatus {
    var label: String {
        switch self {
        case .waiting_for_payment:
            return "Menunggu Pembayaran"
        case .paid:
            return "Dibayar"
        case .cooking:
            return "Dimasak"
        case .shipped:
            return "Dikirim"
        case .done:
            return "Selesai"
        case .canceled:
            return "Dibatalkan"
        }
    }
    
    var color: Color {
        switch self {
        case .waiting_for_payment:
            return Color(hex: 0xFFBA33)
        case .paid:
            return Color(hex: 0x54D33F)
        case .cooking:
            return Color(hex: 0xFFBA33)
        case .shipped:
            return Color(hex: 0xFFBA33)
        case .done:
            return Color(hex: 0x54D33F)
        case .canceled:
            return Color(hex: 0xF85D5D)
        }
    }
}
