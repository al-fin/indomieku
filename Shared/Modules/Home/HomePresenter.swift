//
//  HomePresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI

protocol HomePresenterProtocol {
    var interactor: HomeInteractor { get }
    }

final class HomePresenter: HomePresenterProtocol, ObservableObject {
    internal let interactor: HomeInteractor
    
    let appState = AppState.shared

    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }
}
