//
//  Int.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import Foundation

protocol Num {}

extension Num {
    var formattedCurrency: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id")
        formatter.numberStyle = .currency
        formatter.currencySymbol = "Rp "
        formatter.minimumFractionDigits = 0
        return formatter.string(from: self as! NSNumber) ?? "-"
    }
}

extension Int: Num {}
extension Double: Num {}
