//
//  AppState.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 14/05/22.
//

import Foundation

class AppState: ObservableObject {
    static let shared = AppState()

    @Published var isAuthenticated: Bool {
        didSet {
            UserDefaults.standard.set(isAuthenticated, forKey: "isAuthenticated")
        }
    }
    @Published var bottomNavigation: String = "Home"

    init() {
        self.isAuthenticated = UserDefaults.standard.bool(forKey: "isAuthenticated")
    }
}
