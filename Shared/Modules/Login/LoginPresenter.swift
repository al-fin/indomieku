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
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    
    let appState = AppState.shared

    init(interactor: LoginInteractor) {
        self.interactor = interactor
    }
    
    func onLoginTapped() {
        withAnimation {
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
//                withAnimation {
//                    self?.appState.isAuthenticated = true
//                }
//            })
//            .store(in: &cancellables)
    }
    
    func onRegisterTapped() {
        print("Registering...")
    }
}
