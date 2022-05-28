//
//  Rating.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 22/05/22.
//

import SwiftUI

enum RatingSize: String {
    case small, normal
}

struct Rating: View {
    var value: Double
    let size: RatingSize
    
    init(_ value: Double, size: RatingSize = .normal) {
        self.value = value
        self.size = size
    }
    
    var body: some View {
        HStack(spacing: size == .small ? 2.5 : 5) {
            ForEach(1...5, id: \.self) { i in
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.gold)
                    .frame(width: size == .small ? 12 : 16, height: size == .small ? 12 : 16)
            }
        }
    }
}
