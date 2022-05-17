//
//  APIManager.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import Combine

enum HTTPMethod: String {
    case GET, POST, PUT, PATCH, DELETE
}

enum APIError: Error, CustomStringConvertible {
    case network
    case invalidRequest
    
    var description: String {
        switch self {
        case .network:
            return "Network Error!"
        case .invalidRequest:
            return "Invalid Request!"
        }
    }
}

protocol APIManagerProtocol {
    static var cancellables: Set<AnyCancellable> { get }
    
    static func request<T: Codable>(
        type: HTTPMethod,
        endpoint: String
    ) -> AnyPublisher<T, Error>
}


final class APIManager: APIManagerProtocol {
    static internal var cancellables = Set<AnyCancellable>()

    static func request<T: Codable>(
        type: HTTPMethod,
        endpoint: String
    ) -> AnyPublisher<T, Error> {
        guard let url: URL = URL(string: "\(Config.API_BASE_URL)\(endpoint)") else {
            return Fail(error: APIError.invalidRequest as Error).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer 123", forHTTPHeaderField: "Authorization")
        request.httpMethod = type.rawValue
        
        let publisher = URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { response in
                print("INTERCEPTOR - receiveCompletion")
            }, receiveValue: { value in
                print("INTERCEPTOR - receiveValue")
            })
            .store(in: &cancellables)
        
        return publisher
            
    }
}
