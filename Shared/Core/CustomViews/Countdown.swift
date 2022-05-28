//
//  Countdown.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct Countdown: View {
    var endDate: Date
    
    var body: some View {
        HStack(spacing: 4) {
            HStack {
                Text(endDate.getHour())
                    .font(.headline.weight(.bold))
                    .foregroundColor(.secondarySystemBackground)
                    .padding(.vertical, 4)
                    .frame(width: 36)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .id("COUNTDOWN-HOUR-\(endDate.getHour())")
            }
            .background(Color.accentColor)
            .cornerRadius(6)
            .frame(maxWidth: 36, alignment: .leading)
            .clipped()
            
            Text(":")
                .font(.headline.weight(.bold))
                .foregroundColor(.accentColor)
            
            HStack {
                Text(endDate.getMinute())
                    .font(.headline.weight(.bold))
                    .foregroundColor(.secondarySystemBackground)
                    .padding(.vertical, 4)
                    .frame(width: 36)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .id("COUNTDOWN-MINUTE-\(endDate.getMinute())")
            }
            .background(Color.accentColor)
            .cornerRadius(6)
            .frame(maxWidth: 36, alignment: .leading)
            .clipped()
            
            Text(":")
                .font(.headline.weight(.bold))
                .foregroundColor(.accentColor)
            
            HStack {
                Text(endDate.getSecond())
                    .font(.headline.weight(.bold))
                    .foregroundColor(.secondarySystemBackground)
                    .padding(.vertical, 4)
                    .frame(width: 36)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .id("COUNTDOWN-SECOND-\(endDate.getSecond())")
            }
            .background(Color.accentColor)
            .cornerRadius(6)
            .frame(maxWidth: 36, alignment: .leading)
            .clipped()
        }
    }
}
