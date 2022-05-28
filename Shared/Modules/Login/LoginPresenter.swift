//
//  LoginPresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI
import Combine

protocol LoginPresenterProtocol {
    var interactor: LoginInteractor { get }
    var cancellables: Set<AnyCancellable> { get }
    
    var isLoading: Bool { get }
    var email: String { get }
    var password: String { get }
    
    func onLoginTapped()
    func onRegisterTapped()
}

final class LoginPresenter: LoginPresenterProtocol, ObservableObject {
    internal let interactor: LoginInteractor
    internal var cancellables = Set<AnyCancellable>()
    
    @Published var email = "chelsea.islan@icloud.com"
    @Published var password = "chelsea123"
    @Published var isLoading = false
    
    let appState = AppState.shared

    init(interactor: LoginInteractor) {
        self.interactor = interactor
    }
    
    func onLoginTapped() {
        withAnimation(.easeOut) {
            appState.bottomNavigation = "Home"
            appState.isAuthenticated = true
        }
        
//        isLoading = true
//
//        let publisher = interactor.fetchLoginAPI(
//            email: email,
//            password: password
//        )
//
//        publisher
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { [weak self] response in
//                switch response {
//                case .failure(let error):
//                    print("FAILURE: \(error)")
//                case .finished:
//                    print("Finished!")
//                }
//
//                self?.isLoading = false
//            }, receiveValue: { [weak self] value in
//                print("SUCCESS: \(value)")
//
//                withAnimation(.easeOut) {
//                    appState.bottomNavigation = "Home"
//                    appState.isAuthenticated = true
//                }
//            })
//            .store(in: &cancellables)
    }
    
    func onRegisterTapped() {
        print("Registering...")
    }
}
