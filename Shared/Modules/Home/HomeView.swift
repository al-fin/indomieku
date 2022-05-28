//
//  HomeView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct HomeOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter
    @Environment(\.colorScheme) var colorScheme
    @State private var offset = CGFloat.zero
    
    var body: some View {
        VStack(spacing: 0) {
            HomeNavBar(keyword: $presenter.keyword)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color(hex: 0xFF9393), Color(hex: 0xF85D5D)]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        ZStack {
                            GeometryReader { metrics in
                                Color.accentColor
                                    .frame(height: metrics.size.height * 0.5)
                            }
                            
                            BalanceInformationCard()
                                .padding(.bottom)
                                .padding(.horizontal)
                        }
                        
                        ProductCategories(
                            categories: presenter.categories
                        )
                        .padding(.bottom)
                        .padding(.horizontal)
                    }
                    .background(Color.secondarySystemBackground)
                    .if(colorScheme == .dark) { view in
                        view
                            .border(width: 1, edges: [.bottom], color: Color.label.opacity(0.15))
//                            .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: 0)
                    }
                    
                    Banners(
                        banners: presenter.banners
                    )
                    
                    FlashSale(
                        products: presenter.products
                    )
                    
                    ProductsOverview(
                        title: "Mie Terlaris",
                        products: presenter.products
                    )
                    .background(Color.systemBackground)
                    
                    Spacer()
                }
                .background(GeometryReader {
                    Color.systemBackground.preference(
                        key: HomeOffsetKey.self,
                        value: -$0.frame(in: .named("home-scrollview")).origin.y
                    )
                })
                .onPreferenceChange(HomeOffsetKey.self) { y in
                    offset = y
                }
            }
            .coordinateSpace(name: "home-scrollview")
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        
        .background(offset >= 25 ? Color.systemBackground : Color.accentColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            presenter: HomePresenter(
                interactor: HomeInteractor()
            )
        )
        .background(Color.systemBackground)
    }
}
