//
//  User.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation

struct User: Identifiable, Codable {
    var id: Int
    var avatar: String
    var userID: String
    var name: String
    var email: String
    var phone: String
    var address: String
}
