import SwiftUI

struct NavLink<Label:View, Destination:View>: View {
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(
            destination:
                NavBarContainerView(content: {
                    destination
                })
                .navigationBarHidden(true)
            ,
            label: {
                label
            })
    }
}
