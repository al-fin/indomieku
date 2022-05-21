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

enum IconSource: String {
    case sf_symbol, assets
}

enum TextFieldSize: String {
    case large, normal
}

enum TextFieldTheme: String {
    case system, light
}

extension Image {
    func textFieldIcon(size: TextFieldSize = .normal) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: size == .large ? 24 : 16)
    }
}

struct CustomTextField: View {
    @Environment(\.colorScheme) var colorScheme

    var type: TextFieldType
    var label: String
    var placeholder: String?
    var text: Binding<String>
    var startIcon: String?
    var endIcon: String?
    var iconSource: IconSource
    var size: TextFieldSize
    var theme: TextFieldTheme

    init(
        type: TextFieldType = .text,
        label: String,
        placeholder: String? = nil,
        text: Binding<String>,
        startIcon: String? = nil,
        endIcon: String? = nil,
        iconSource: IconSource = .sf_symbol,
        size: TextFieldSize = .normal,
        theme: TextFieldTheme = .system
    ) {
        self.type = type
        self.label = label
        self.placeholder = placeholder
        self.text = text
        self.startIcon = startIcon
        self.endIcon = endIcon
        self.iconSource = iconSource
        self.size = size
        self.theme = theme
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if label != "" {
                Text(label)
                    .font(.caption.weight(.bold))
                    .foregroundColor(theme == .light ? .white : .systemBackground)
            }
            
            HStack {
                if startIcon != nil {
                    AnyView(
                        iconSource == .assets ?
                        Image(startIcon!).renderingMode(.template)
                            .textFieldIcon(size: size) :
                        Image(systemName: startIcon!)
                            .textFieldIcon(size: size)
                    )
                        
                    .foregroundColor(theme == .light ? .black.opacity(0.25) : .label.opacity(0.25))
                }
                
                textField
                    .foregroundColor(theme == .light ? .black.opacity(0.75) : .label)
                    .placeholder(when: text.wrappedValue.isEmpty) {
                        Text(placeholder ?? label).foregroundColor(theme == .light ?  .black.opacity(0.25) : .label.opacity(0.25))
                    }
                
                if endIcon != nil {
                    AnyView(
                        iconSource == .assets ?
                        Image(endIcon!).renderingMode(.template)
                            .textFieldIcon(size: size) :
                        Image(systemName: endIcon!)
                            .textFieldIcon(size: size)
                    )
                    .foregroundColor(theme == .light ?  .black.opacity(0.25) : .label.opacity(0.25))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, size == .large ? 16 : 8)
            .background(theme == .light ? Color.white : Color.tertiarySystemBackground)
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
