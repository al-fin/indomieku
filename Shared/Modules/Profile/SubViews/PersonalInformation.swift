//
//  PersonalInformation.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 27/05/22.
//

import SwiftUI

struct PersonalInformation: View {
    var items: [Item]
    
    var body: some View {
        Group {
            ForEach(0..<items.count) { i in
                let item = items[i]
                if i != 0 {
                    Divider().background(Color.tertiaryLabel)
                }

                HStack(alignment: .top) {
                    Text(item.key)
                        .font(.body.weight(.semibold))
                    Spacer()
                    Text(item.value)
                        .font(.body.weight(.regular))
                        .foregroundColor(.secondaryLabel)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
}
