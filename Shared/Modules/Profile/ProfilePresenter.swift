//
//  ProfilePresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI

protocol ProfilePresenterProtocol {
    var interactor: ProfileInteractor { get }
    
    var profile: User { get }
    func logout() -> Void
}

final class ProfilePresenter: ProfilePresenterProtocol, ObservableObject {
    internal let interactor: ProfileInteractor
    
    let appState = AppState.shared
    
    var profile: User = User(
        id: 1,
        avatar: "avatar",
        userID: "001223848815",
        name: "Chelsea Islan",
        email: "chelsea.islan@icloud.com",
        phone: "08122378282",
        address: "Jl. Andara Raya, Pangkalan Jati Baru, Kec. Cinere, Cinere, Jakarta Selatan, DKI Jakarta 1245"
    )
    
    init(interactor: ProfileInteractor) {
        self.interactor = interactor
    }
    
    func logout() {
        withAnimation {
            appState.isAuthenticated = false
        }
    }
}
