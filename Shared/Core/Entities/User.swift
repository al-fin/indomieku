//
//  User.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation

struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var email: String
}
