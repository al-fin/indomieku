//
//  DeliveryTimeline.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//

import SwiftUI

struct DeliveryTimeline: View {
    var body: some View {
        VStack {
            ForEach(0..<4) { i in
                DeliveryTimelineItem(
                    deliveryTracking: DeliveryTracking(type: .paid, date: "2022-05-01T12:00:00".convertToDate())
                )
            }
        }
    }
}

struct DeliveryTimelineItem: View {
    var deliveryTracking: DeliveryTracking
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(deliveryTracking.icon)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .border(width: 2, cornerRadius: 20, color: .accentColor)
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(deliveryTracking.date.formattedDate())
                        .font(.body.weight(.bold))
                        .foregroundColor(.label)
                    
                    Text(deliveryTracking.date.formattedDate())
                        .font(.caption.weight(.light))
                        .foregroundColor(.secondaryLabel)
                }
                
                Spacer().frame(height: 5)
                
                Text(deliveryTracking.description)
                    .font(.body.weight(.light))
                    .foregroundColor(.label)
                                
                Spacer()
            }
        }
        .padding(.vertical, 5)
    }
}

