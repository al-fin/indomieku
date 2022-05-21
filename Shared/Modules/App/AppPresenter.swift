//
//  AppPresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI

protocol AppPresenterProtocol {
    var interactor: AppInteractor { get }
}

final class AppPresenter: AppPresenterProtocol, ObservableObject {
    internal let interactor: AppInteractor
    
    var appState = AppState.shared
    
    init(interactor: AppInteractor) {
        self.interactor = interactor
    }
}
