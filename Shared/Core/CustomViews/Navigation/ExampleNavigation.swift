import SwiftUI

struct ExampleNavigation: View {
    var body: some View {
        NavView {
            ZStack {
                Color.secondarySystemBackground.ignoresSafeArea()
                                
                NavLink(
                    destination: Text("Destination")
                                    .navBarTitle("Second Screen")
                                    .navBarBackButtonHidden(false)
                ) {
                    Text("Navigate")
                }
            }
            .navBarTitle("First Screen")
            .navBarBackButtonHidden(true)
        }
    }
}

struct ExampleNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ExampleNavigation()
    }
}
