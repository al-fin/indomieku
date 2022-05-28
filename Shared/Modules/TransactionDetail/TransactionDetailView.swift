//
//  TransactionDetailView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//


import SwiftUI


struct TransactionDetailView: View {
    @ObservedObject var presenter: TransactionDetailPresenter
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var offset = CGFloat.zero
    
    var body: some View {
        let product = presenter.transaction.product
        
        return VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(product.images[0])
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(
                                    product.totalPrice.formattedCurrency
                                )
                                    .font(.title2.weight(.bold))
                                    .foregroundColor(.accentColor)
                                
                                if product.discount > 0 {
                                    Text(product.price.formattedCurrency)
                                        .font(.body.weight(.light))
                                        .foregroundColor(.secondaryLabel)
                                        .strikethrough(color: .secondaryLabel)
                                }
                            }
                            
                            Spacer()
                            
                            if product.discount > 0 {
                                Text("\(Int(product.discount))%")
                                    .font(.caption.weight(.regular))
                                    .foregroundColor(.accentColor)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 8)
                                    .background(Color.accentColor.opacity(0.15))
                                    .cornerRadius(8)
                                    .border(width: 1, cornerRadius: 8, color: Color.accentColor.opacity(0.5))
                            }
                        }
                        
                        
                        Divider()
                            .background(Color.tertiaryLabel)
                            .frame(height: 20)
                        
                        ProductInformation(transaction: presenter.transaction)
                        
                        Divider()
                            .background(Color.tertiaryLabel)
                            .frame(height: 20)
                        
                        DeliveryInformation(transaction: presenter.transaction)
                        
                        Divider()
                            .background(Color.tertiaryLabel)
                            .frame(height: 20)
                        
                        PaymentInformation(transaction: presenter.transaction)
                        
                    }
                    .padding(.horizontal)
                    
                    
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.top)
            .background(Color.secondarySystemBackground)
            
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Di atas adalah tampilan produk pada tanggal :")
                        .font(.caption2.weight(.light))
                        .foregroundColor(.secondaryLabel)
                    
                    Text(presenter.transaction.paidAt.formattedDate())
                        .font(.caption2.weight(.bold))
                        .foregroundColor(.label)
                }
                
                Spacer()
                
                
                NavLink(destination: ProductDetailView(
                    presenter: ProductDetailPresenter(
                        interactor: ProductDetailInteractor()
                    )
                )) {
                    Text("Detail Produk")
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
        .navBarTitle(product.name)
    }
}



struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(
            presenter: TransactionDetailPresenter(
                interactor: TransactionDetailInteractor()
            )
        )
    }
}
