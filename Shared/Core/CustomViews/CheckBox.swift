//
//  Checkbox.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 23/05/22.
//

import SwiftUI

struct CheckBox: View {
    @Binding var checked: Bool
    var onChange: () -> Void = {}

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .font(.title2)
            .foregroundColor(checked ? Color.green : Color.tertiaryLabel)
            .onTapGesture {
                withAnimation {
                    self.checked.toggle()
                }
                
                self.onChange()
            }
    }
}
