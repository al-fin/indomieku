//
//  Notification.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 22/05/22.
//

import Foundation

enum NotificationType: String {
    case info, payment, delivery
}

struct Notification {
    var id: Int
    var type: NotificationType
    var title: String
    var content: String
    var date: Date
}
