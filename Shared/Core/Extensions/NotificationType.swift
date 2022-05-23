//
//  NotificationType.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 22/05/22.
//

import SwiftUI

extension NotificationType {
    var icon: String {
        switch self {
        case .delivery:
            return "icon.delivery"
        case .payment:
            return "icon.payment"
        case .info:
            return "icon.info"
        }
    }
    
    var color: Color {
        switch self {
        case .delivery:
            return Color(hex: 0xFFBA33)
        case .payment:
            return Color(hex: 0x54D33F)
        case .info:
            return Color(hex: 0x3CBAE2)
        }
    }
}
