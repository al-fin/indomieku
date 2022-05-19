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
            homeNavBar
                .padding()
                .padding(.bottom, 50)
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
                ProductCategories(
                    categories: presenter.categories
                )
                .padding(.top, 50)
                
                BalanceInformationCard()
                    .offset(x: 0, y: -110)
            }
            .padding()
            .background(Color.secondarySystemBackground)
            .if(colorScheme == .dark) { view in
                view
                    .border(width: 1, edges: [.bottom], color: Color.label.opacity(0.15))
                    .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: 0)
            }
            
  
            Banners(banners: presenter.banners)
            
            
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Flash Sale")
                            .font(.title3.weight(.bold))
                            .foregroundColor(.accentColor)
                        Text("Kejar diskon spesial!")
                            .font(.caption.weight(.light))
                            .foregroundColor(.label)
                    }
                    
                    Spacer()
                    
                    Countdown()
                }
                .padding()
                .background(Color.secondarySystemBackground.ignoresSafeArea())
                .if(colorScheme == .dark) { view in
                    view.border(width: 1, edges: [.leading, .top, .trailing, .bottom], color: Color.label.opacity(0.15))
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(0..<9) { i in
                            ProductCard()
                                .padding(.leading, i == 0 ? nil : 0)
                                .padding(.trailing, nil)
                        }
                    }
                }
                .padding(.vertical)
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
            }
            .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Mie Terlaris")
                        .font(.title.weight(.bold))
                        .foregroundColor(.label)
                    
                    Spacer()
                    
                    Group {
                        Text("Selengkapnya")
                        Image(systemName: "arrow.forward")
                    }
                    .font(.body.weight(.bold))
                    .foregroundColor(.accentColor)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(0..<9) { i in
                            ProductCard()
                                .padding(.leading, i == 0 ? nil : 0)
                                .padding(.trailing, nil)
                        }
                    }
                    .padding(.bottom)
                }
                .padding(.vertical)
            }
            .padding(.vertical)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    var homeNavBar: some View {
        HStack(spacing: 20) {
            CustomTextField(
                label: "",
                placeholder: "Cari mie favoritmu di sini...",
                text: $presenter.keyword,
                startIcon: "icon.search",
                iconSource: .assets
            )
            
            Image("icon.cart")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(height: 32)
                .foregroundColor(.tertiarySystemBackground)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                .overlay(Badge(count: 3))
            
            Image("icon.notification")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(height: 32)
                .foregroundColor(.tertiarySystemBackground)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
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

struct ProductCard: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("mie")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Rp 15,000")
                            .font(.title3.weight(.bold))
                            .foregroundColor(.accentColor)
                        
                        Text("Rp 30,000")
                            .font(.caption.weight(.light))
                            .foregroundColor(.secondaryLabel)
                            .strikethrough()
                    }
                    
                    Spacer()
                    
                    Text("50%")
                        .font(.caption.weight(.regular))
                        .foregroundColor(.accentColor)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color.accentColor.opacity(0.25))
                        .border(width: 1, edges: [.leading, .top, .trailing, .bottom], color: Color.accentColor.opacity(0.5))
                        .cornerRadius(8)
                }
                
                Text("Indomie Goreng")
                    .font(.title3.weight(.bold))
                    .foregroundColor(.label)
                
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.secondaryColor)
                    
                    Text("5.0  |  784 Terjual")
                        .font(.caption.weight(.light))
                        .foregroundColor(.secondaryLabel)
                }
            }
            .padding()
            .background(Color.secondarySystemBackground)
        }
        .card()
    }
}

struct Countdown: View {
    var body: some View {
        Group {
            Text("00")
                .font(.title3.weight(.bold))
                .foregroundColor(.secondarySystemBackground)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.accentColor)
                .cornerRadius(8)
            
            Text(":")
                .font(.title3.weight(.bold))
                .foregroundColor(.accentColor)
            
            Text("05")
                .font(.title3.weight(.bold))
                .foregroundColor(.secondarySystemBackground)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.accentColor)
                .cornerRadius(6)
            
            Text(":")
                .font(.title3.weight(.bold))
                .foregroundColor(.accentColor)
            
            Text("13")
                .font(.title3.weight(.bold))
                .foregroundColor(.secondarySystemBackground)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.accentColor)
                .cornerRadius(6)
        }
    }
}

struct Banners: View {
    var banners: [String]
    
    @Environment(\.colorScheme) var colorScheme
    @State private var activeBanner = "1-banner"
    
    var body: some View {
        Group {
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
            .frame(height: 210)
            
            HStack {
                ForEach(banners, id: \.self) { banner in
                    Rectangle()
                        .fill(banner == activeBanner ? Color.accentColor : Color.quaternaryLabel)
                        .frame(width: banner == activeBanner ? 45 : 15, height: 15)
                        .cornerRadius(7.5)
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


struct Badge: View {
    let count: Int

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.clear
            Text(String(count))
                .font(.system(size: 14).weight(.bold))
                .frame(width: 24, height: 24)
                .foregroundColor(Color(hex: 0xD36602))
                .background(Color.secondaryColor)
                .clipShape(Circle())
                // custom positioning in the top-right corner
                .alignmentGuide(.top) { $0[.bottom] }
                .alignmentGuide(.trailing) { $0[.trailing] - $0.width * 0.25 }
        }
    }
}

struct BalanceInformationCard: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: 20) {
            Image("icon.wallet")
                .resizable()
                .scaledToFit()
                .frame(height: 44)
            
            VStack(alignment: .leading) {
                Text("Rp 12,000,000")
                    .font(.title.weight(.bold))
                    .foregroundColor(.label)
                
                Text("Saldo iFoodPay")
                    .font(.caption.weight(.light))
                    .foregroundColor(.secondaryLabel)
            }
            
            Spacer()
            
            Image(systemName: "eye.slash.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 18)
                .foregroundColor(.tertiaryLabel)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.tertiarySystemBackground.ignoresSafeArea())
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 2)
        .if(colorScheme == .dark) { view in
            view.border(width: 1, edges: [.leading, .top, .trailing, .bottom], color: Color.label.opacity(0.15))
        }
    }
}

struct ProductCategories: View {
    var categories: [ProductCategory]
    
    let columns = [
      GridItem(.flexible()),
      GridItem(.flexible()),
      GridItem(.flexible()),
      GridItem(.flexible()),
      GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(categories, id: \.name) { item in
                VStack(spacing: 5) {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 5)
                    
                    Text(item.name)
                        .font(.system(size: 9, weight: .semibold))
                        .foregroundColor(.label)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}
