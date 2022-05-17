//
//  TextField.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 14/05/22.
//

import SwiftUI

struct CustomTextField: View {
    var label: String
    var placeholder: String?
    var text: Binding<String>
    var startIcon: String?
    var endIcon: String?

    init(
        label: String,
        placeholder: String? = nil,
        text: Binding<String>,
        startIcon: String? = nil,
        endIcon: String? = nil
    ) {
        self.label = label
        self.placeholder = placeholder
        self.text = text
        self.startIcon = startIcon
        self.endIcon = endIcon
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.caption.weight(.bold))
                .foregroundColor(.white)
            
            HStack {
                if startIcon != nil {
                    Image(systemName: startIcon!)
                        .foregroundColor(.secondaryLabel)
                }
                
                TextField(placeholder ?? label, text: text)
                
                if endIcon != nil {
                    Image(systemName: endIcon!)
                        .foregroundColor(.secondaryLabel)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color(hex: 0x000000, alpha: 0.1), radius: 5, x: 0, y: 5)
        }
     }
}
