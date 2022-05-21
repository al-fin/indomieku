//
//  IndomiekuApp.swift
//  Shared
//
//  Created by Alfin on 10/05/22.
//

import SwiftUI

@main
struct IndomiekuApp: App {
    @StateObject private var database = DBManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
