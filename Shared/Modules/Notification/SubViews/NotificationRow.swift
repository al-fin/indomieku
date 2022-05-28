//
//  NotificationRow.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 25/05/22.
//

import SwiftUI

struct NotificationRow: View {
    var notification: Notification
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(notification.icon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(notification.color)
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(notification.title)
                    .font(.caption.weight(.bold))
                    .foregroundColor(.label)
                    .padding(.top, 5)
                
                Text(notification.content)
                    .font(.body.weight(.regular))
                    .foregroundColor(.secondaryLabel)
                
                HStack(spacing: 2) {
                    Image("icon.time")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 15, height: 15)
                    
                    Text(notification.date.formattedDate())
                        .font(.caption.weight(.light))
                }
                .foregroundColor(.secondaryLabel)
            }
        }
        .padding()
        .border(width: 1, edges: [.bottom], color: Color.label.opacity(0.15))
    }
}
