import SwiftUI

struct NavBarView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme

    let show: Bool
    let showBackButton: Bool
    let title: String
    
    var body: some View {
        if show {
            HStack {
                if showBackButton {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .font(.title2)
                    })
                }
                
                VStack(spacing: 4) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.label)
                }
                
                Spacer()
            }
            .padding()
            .background(Color.systemBackground.ignoresSafeArea())
            .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: 2)
            .if(colorScheme == .dark) { view in
                view.border(width: 1, edges: [.bottom], color: Color.label.opacity(0.15))
            }
        } else {
            EmptyView()
        }
    }
}
