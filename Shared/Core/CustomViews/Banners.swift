//
//  Banners.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct Banners: View {
    var banners: [String]
    
    @Environment(\.colorScheme) var colorScheme
    @State private var activeBanner = "1-banner"
    
    var body: some View {
        VStack {
            TabView(selection: $activeBanner.animation()) {
                ForEach(banners, id: \.self) { banner in
                    Image(banner)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(16)
                        .if(colorScheme == .dark) { view in
                            view
                                .border(width: 1, edges: [.bottom], color: Color.label.opacity(0.15))
                                .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: 0)
                        }
                        .padding(.horizontal)
                        .tag(banner)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 175)
            
            HStack {
                ForEach(banners, id: \.self) { banner in
                    RoundedRectangle(cornerRadius: 7.5)
                        .fill(banner == activeBanner ? Color.accentColor : Color.quaternaryLabel)
                        .frame(width: banner == activeBanner ? 45 : 15, height: 15)
                        .onTapGesture {
                            withAnimation {
                                activeBanner = banner
                            }
                        }
                }
            }
        }
    }
}

