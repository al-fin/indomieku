//
//  ProductDetailView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//


import SwiftUI

struct ProductDetailOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct ProductDetailView: View {
    @ObservedObject var presenter: ProductDetailPresenter
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme

    @State private var offset = CGFloat.zero
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack(alignment: .topLeading) {
                        Image(presenter.product.images[0])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "arrow.backward")
                                .font(.title2)
                                .foregroundColor(.accentColor)
                                .frame(width: 50, height: 50)
                                .background(.thinMaterial)
                                .cornerRadius(25)
                                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                                .padding(.leading)
                        })
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(
                                    presenter.product.totalPrice.formattedCurrency
                                )
                                    .font(.title2.weight(.bold))
                                    .foregroundColor(.accentColor)
                                
                                if presenter.product.discount > 0 {
                                    Text(presenter.product.price.formattedCurrency)
                                        .font(.body.weight(.light))
                                        .foregroundColor(.secondaryLabel)
                                        .strikethrough(color: .secondaryLabel)
                                }
                            }
                            
                            Spacer()
                            
                            if presenter.product.discount > 0 {
                                Text("\(Int(presenter.product.discount))%")
                                    .font(.caption.weight(.regular))
                                    .foregroundColor(.accentColor)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 8)
                                    .background(Color.accentColor.opacity(0.15))
                                    .cornerRadius(8)
                                    .border(width: 1, cornerRadius: 8, color: Color.accentColor.opacity(0.5))
                            }
                        }
                        
                        
                        Text(presenter.product.name)
                            .font(.title.weight(.bold))
                            .foregroundColor(.label)
                        
                        Spacer().frame(height: 5)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .font(.body)
                                .foregroundColor(.gold)
                            
                            Text("\(presenter.product.rating, specifier: "%.1f")  |  \(presenter.product.totalSold) Terjual")
                                .font(.body.weight(.light))
                                .foregroundColor(.secondaryLabel)
                        }
                        
                        Spacer().frame(height: 20)
                        
                        Text(presenter.product.description)
                            .font(.body.weight(.light))
                            .foregroundColor(.label)
                        
                        Spacer().frame(height: 20)
                        
                        Group {
                            Text("Ulasan Pembeli")
                                .font(.title2.weight(.bold))
                                .foregroundColor(.accentColor)
                            
                            Text("\(presenter.reviews.count) Ulasan")
                                .font(.caption.weight(.light))
                                .foregroundColor(.label)
                        }
                        
                        ForEach(0..<presenter.reviews.count) { i in
                                                        
                            if i != 0 && i != presenter.reviews.count-1 {
                                Divider().background(Color.tertiaryLabel)
                            }
                            
                            ReviewRow(review: presenter.reviews[i])
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    Spacer()
                }
                .background(GeometryReader {
                    Color.clear.preference(
                        key: ProductDetailOffsetKey.self,
                        value: -$0.frame(in: .named("product-detail-scrollview")).origin.y
                    )
                })
                .onPreferenceChange(ProductDetailOffsetKey.self) { y in
                    withAnimation {
                        offset = y
                    }
                }
            }
            .coordinateSpace(name: "product-detail-scrollview")
            .edgesIgnoringSafeArea(.top)
            .background(Color.secondarySystemBackground)
            .navBarHidden(true)
            .overlay(alignment: .top) {
                Color.clear
                    .if(offset >= 10) { view in
                        view.background(.thinMaterial)
                    }
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 0) // constrain the overlay to above the top safe area
                    .navBarHidden(true)
            }
            
            HStack(spacing: 10) {
                Button(action: {}) {
                    Image("icon.chat")
                        .renderingMode(.template)
                }
                .buttonStyle(OutlinedButton(size: .small))
                                
                Button("Beli Langsung") {
                    
                }
                .buttonStyle(OutlinedButton())
                                
                Button("+ Keranjang") {
                    
                }
                .buttonStyle(AccentButton())
            }
            .zIndex(2)
            .edgesIgnoringSafeArea(.bottom)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.secondarySystemBackground)
            .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: 0)
            .if(colorScheme == .dark) { view in
                view.border(width: 1, edges: [.top], color: Color.label.opacity(0.15))
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            presenter: ProductDetailPresenter(
                interactor: ProductDetailInteractor()
            )
        )
    }
}
