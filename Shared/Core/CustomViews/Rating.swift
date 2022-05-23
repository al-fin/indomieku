//
//  Rating.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 22/05/22.
//

import SwiftUI

struct Rating: View {
    var value: Double
    let size: CGFloat
    
    init(_ value: Double, size: Int = 15) {
        self.value = value
        self.size = CGFloat(size)
    }
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { i in
                Image(systemName: "star.fill")
                    .font(.caption)
                    .foregroundColor(.gold)
                    .frame(width: size, height: size)
            }
        }
    }
}
