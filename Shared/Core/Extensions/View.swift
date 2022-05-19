//
//  View.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 16/05/22.
//

import SwiftUI

// conditional view modifier :

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

// border :

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

// placeholder

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


// card

extension View {

    func card() -> some View {
        @Environment(\.colorScheme) var colorScheme
        
        return self
            .frame(maxWidth: .infinity)
            .background(Color.tertiarySystemBackground.ignoresSafeArea())
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 2)
            .if(colorScheme == .dark) { view in
                view.border(width: 1, edges: [.leading, .top, .trailing, .bottom], color: Color.label.opacity(0.15))
            }
    }
}
