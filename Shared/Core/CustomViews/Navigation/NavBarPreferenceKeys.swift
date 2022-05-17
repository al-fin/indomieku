import Foundation
import SwiftUI

struct NavBarTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct NavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}


struct NavBarHiddenPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    func navBarTitle(_ title: String) -> some View {
        preference(key: NavBarTitlePreferenceKey.self, value: title)
    }

    func navBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: NavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func navBarHidden(_ hidden: Bool) -> some View {
        preference(key: NavBarHiddenPreferenceKey.self, value: hidden)
    }
}
