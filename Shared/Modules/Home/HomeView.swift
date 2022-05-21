//
//  HomeView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0) {
            HomeNavBar(keyword: $presenter.keyword)
                .padding()
                .padding(.bottom, 40)
                .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top )
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color(hex: 0xFF9393), Color(hex: 0xF85D5D)]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                )
            
         
            ZStack {
                BalanceInformationCard()
                    .zIndex(2)
                    .offset(x: 0, y: -100)
                
                ProductCategories(
                    categories: presenter.categories
                )
                .zIndex(1)
                .padding(.top, 40)
            }
            .padding()
            .background(Color.secondarySystemBackground)
            .if(colorScheme == .dark) { view in
                view
                    .border(width: 1, edges: [.bottom], color: Color.label.opacity(0.15))
                    .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: 0)
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
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
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
