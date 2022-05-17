import SwiftUI

struct NavBarContainerView<Content: View>: View {
    let content: Content
    @State private var show: Bool = true
    @State private var showBackButton: Bool = false
    @State private var title: String = ""
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if show {
                    navBarView
                        .opacity(0)
                }
                
                content.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onPreferenceChange(NavBarTitlePreferenceKey.self) { value in
                        print("NavBarTitlePreferenceKey: \(value)")
                        title = value
                    }
                    .onPreferenceChange(NavBarBackButtonHiddenPreferenceKey.self) { value in
                        showBackButton = !value
                    }
                    .onPreferenceChange(NavBarHiddenPreferenceKey.self) { value in
                        show = !value
                    }
            }
            
            VStack {
                navBarView

                Spacer()
            }
        }
    }
    
    var navBarView: some View {
        NavBarView(show: show, showBackButton: showBackButton, title: title)
    }
}
