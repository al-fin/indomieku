//
//  LoginInteractor.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import Combine

protocol LoginInteractorProtocol {
    func fetchLoginAPI(
        email: String,
        password: String
    ) -> AnyPublisher<User, Error>
}

final class LoginInteractor: LoginInteractorProtocol {
    func fetchLoginAPI(
        email: String,
        password: String
    ) -> AnyPublisher<User, Error> {
        let publisher: AnyPublisher<User, Error> = APIManager.request(
            type: .GET,
            endpoint: "/b/LNBL"
        )
        
        return publisher
    }
}
