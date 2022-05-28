//
//  Banners.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct Banners: View {
    var banners: [String]
    var activeBanner: Binding<Int>
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            TabView(selection: activeBanner.animation()) {
                ForEach(0..<banners.count, id: \.self) { i in
                    let banner = banners[i]
                    
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
                        .tag(i)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 175)
            
            HStack {
                ForEach(0..<banners.count, id: \.self) { i in
                    RoundedRectangle(cornerRadius: 7.5)
                        .fill(i == activeBanner.wrappedValue ? Color.accentColor : Color.quaternaryLabel)
                        .frame(width: i == activeBanner.wrappedValue ? 45 : 15, height: 15)
                        .onTapGesture {
                            withAnimation {
                                activeBanner.wrappedValue = i
                            }
                        }
                }
            }
        }
    }
}

