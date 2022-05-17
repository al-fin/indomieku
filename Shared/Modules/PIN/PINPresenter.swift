//
//  PINPresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI
import Combine

protocol PINPresenterProtocol {
    var interactor: PINInteractor { get }
    var cancellables: Set<AnyCancellable> { get }

    var pin: String { get }
    var isLoading: Bool { get }

    func onInputPIN(_ num: Int)
    func onDeletePIN()
}

final class PINPresenter: PINPresenterProtocol, ObservableObject {
    internal let interactor: PINInteractor
    internal var cancellables = Set<AnyCancellable>()

    @Published var pin = ""
    @Published var isLoading = false

    init(interactor: PINInteractor) {
        self.interactor = interactor
        
        $pin
            .filter { $0.count == 6 }
            .sink(receiveValue: { value in
                print(value)
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
}
