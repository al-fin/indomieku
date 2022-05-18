//
//  TextField.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 14/05/22.
//

import SwiftUI

enum TextFieldType: String {
    case text, password
}

struct CustomTextField: View {
    @Environment(\.colorScheme) var colorScheme

    var type: TextFieldType
    var label: String
    var placeholder: String?
    var text: Binding<String>
    var startIcon: String?
    var endIcon: String?

    init(
        type: TextFieldType = .text,
        label: String,
        placeholder: String? = nil,
        text: Binding<String>,
        startIcon: String? = nil,
        endIcon: String? = nil
    ) {
        self.type = type
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
                
                textField
                    .foregroundColor(.black.opacity(0.75))
                    .placeholder(when: text.wrappedValue.isEmpty) {
                        Text(placeholder ?? label).foregroundColor(.black.opacity(0.25))
                    }
                
                if endIcon != nil {
                    Image(systemName: endIcon!)
                        .foregroundColor(.black.opacity(0.25))
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        }
     }
    
    var textField: some View {
        VStack {
            if type == .password {
                SecureField("", text: text)
            } else {
                TextField("", text: text)
            }
        }
    }
}
