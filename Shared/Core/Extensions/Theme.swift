//
//  Theme.swift
//  Indomieku
//
//  Created by Alfin on 10/05/22.
//

import Foundation

protocol ThemeProtocol {
    static var cardCornerRadius: Double { get }
}

struct Theme: ThemeProtocol {
    static let cardCornerRadius: Double = 12
}
