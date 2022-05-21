//
//  Countdown.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct Countdown: View {
    var body: some View {
        Group {
            Text("00")
                .font(.headline.weight(.bold))
                .foregroundColor(.secondarySystemBackground)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.accentColor)
                .cornerRadius(8)
            
            Text(":")
                .font(.headline.weight(.bold))
                .foregroundColor(.accentColor)
            
            Text("05")
                .font(.headline.weight(.bold))
                .foregroundColor(.secondarySystemBackground)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.accentColor)
                .cornerRadius(6)
            
            Text(":")
                .font(.headline.weight(.bold))
                .foregroundColor(.accentColor)
            
            Text("13")
                .font(.headline.weight(.bold))
                .foregroundColor(.secondarySystemBackground)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.accentColor)
                .cornerRadius(6)
        }
    }
}
