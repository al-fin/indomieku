//
//  PINPresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI
import Combine
import LocalAuthentication


protocol PINPresenterProtocol {
    var interactor: PINInteractor { get }

    var pin: String { get }
    var isLoading: Bool { get }
    var isPresented: Binding<Bool> { get }

    func onInputPIN(_ num: Int)
    func onDeletePIN()
    func authenticateFaceID()
}

final class PINPresenter: PINPresenterProtocol, ObservableObject {
    internal let interactor: PINInteractor
    internal var cancellables = Set<AnyCancellable>()
    
    
    var isPresented: Binding<Bool>
    
    @Published var pin = ""
    @Published var isLoading = false
        
    init(interactor: PINInteractor, isPresented: Binding<Bool>) {
        self.interactor = interactor
        self.isPresented = isPresented

        $pin
            .filter { $0.count == 6 }
            .sink(receiveValue: { [weak self] value in
                print(value)
                
                self?.isPresented.wrappedValue = false
            })
            .store(in: &cancellables)
    }

    func onInputPIN(_ num: Int) {
        if pin.count < 6 {
            pin = "\(pin)\(num)"
        }
    }

    func onDeletePIN() {
        if pin.count > 0 {
            pin.removeLast()
        }
    }
    
    func authenticateFaceID() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "For payment verification."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
                if success {
                    self?.isPresented.wrappedValue = false
                } else {
                    print("Error", authenticationError as Any)
                }
            }
        } else {
            print("No Biometric")
        }
    }
}
