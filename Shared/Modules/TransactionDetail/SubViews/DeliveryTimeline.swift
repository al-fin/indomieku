//
//  DeliveryTimeline.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//

import SwiftUI

struct DeliveryTimeline: View {
    var trackings: [DeliveryTracking]
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<trackings.count) { i in
                let tracking = trackings[i]
                
                HStack(alignment: .top, spacing: 10) {
                    ZStack(alignment: .top) {
                        if i != trackings.count-1 {
                            DashedLine()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                .fill(Color.accentColor)
                                .frame(width: 1, height: 60)
                        }
                        
                        Image(tracking.icon)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.accentColor)
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .padding(8)
                            .background(colorScheme == .dark ? Color(hex: 0x5C3445) : Color(hex: 0xFDD7D7))
                            .cornerRadius(16)
                            .border(width: 1, cornerRadius: 16, color: Color.accentColor)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom) {
                            Text(tracking.date.getDate())
                                .font(.body.weight(.bold))
                                .foregroundColor(.label)
                            
                            Text(tracking.date.getTime())
                                .font(.caption.weight(.light))
                                .foregroundColor(.secondaryLabel)
                        }
                        
                        Spacer().frame(height: 5)
                        
                        Text(tracking.description)
                            .font(.body.weight(.light))
                            .foregroundColor(.label)
                    }
                }
            }
        }
    }
}
