//
//  AppState.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 14/05/22.
//

import Foundation
import SwiftUI

protocol AppStateProtocol {
    static var shared: AppState { get }
    var isAuthenticated: Bool { get set }
    var bottomNavigation: String { get set }
    
    func updateTheme() -> Void
}

enum AppTheme: String {
    case dark, light, system
}

class AppState: ObservableObject, AppStateProtocol {
    static let shared = AppState()

    @Published var isAuthenticated: Bool {
        didSet {
            UserDefaults.standard.set(isAuthenticated, forKey: "isAuthenticated")
        }
    }
    @Published var bottomNavigation: String = "Home"
    
    @AppStorage("theme") var theme: AppTheme = .light

    init() {
        self.isAuthenticated = UserDefaults.standard.bool(forKey: "isAuthenticated")
        
        self.updateTheme()
    }

    func updateTheme() {
        var userInterfaceStyle: UIUserInterfaceStyle

        if theme == .dark {
            userInterfaceStyle = .dark
        } else if theme == .light {
            userInterfaceStyle = .light
        } else {
            userInterfaceStyle = .unspecified
        }
    
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = userInterfaceStyle
    }

}
