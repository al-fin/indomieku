//
//  ReviewRow.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//

import SwiftUI

struct ReviewRow: View {
    var review: Review
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(review.user.avatar)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .border(width: 2, cornerRadius: 20, color: .accentColor)
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(review.user.name)
                        .font(.body.weight(.bold))
                        .foregroundColor(.label)
                    
                    Text(review.date.formattedDate())
                        .font(.caption.weight(.light))
                        .foregroundColor(.secondaryLabel)
                }
                
                Spacer().frame(height: 5)
                
                Text(review.content)
                    .font(.body.weight(.light))
                    .foregroundColor(.label)
                
                Rating(review.rating)
                
                Spacer()
            }
        }
        .padding(.vertical, 5)
    }
}

