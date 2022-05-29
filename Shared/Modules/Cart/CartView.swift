//
//  CartView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var presenter: CartPresenter
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showPINView = false

    var body: some View {
        let checkedCarts = presenter.carts.filter { $0.checked }
        
        return VStack(spacing: 0) {
            HStack {
                Text("Pilih Semua \(checkedCarts.count == 0 ? "" : "(\(checkedCarts.count)/\(presenter.carts.count))")")
                    .font(.body.weight(.regular))

                Spacer()
                
                CheckBox(checked: $presenter.checkedAll) {
                    withAnimation {
                        presenter.handleCheckAll()
                    }
                }
            }
            .zIndex(3)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(Color.secondarySystemBackground)
            .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: 0)
            .if(colorScheme == .dark) { view in
                view.border(width: 1, edges: [.bottom], color: Color.label.opacity(0.15))
            }
            
            List {
                ForEach(0..<presenter.carts.count, id: \.self) { i in
                    CartRow(
                        cart: $presenter.carts[i]
                    )
                    .padding(.top, i == 0 ? 10 : 0)
                    .padding(.bottom, 10)
                }
                .onDelete(perform: presenter.handleDelete)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .zIndex(1)
            .listStyle(PlainListStyle())
            
            if checkedCarts.count > 0 {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Total Harga")
                            .font(.caption.weight(.light))
                            .foregroundColor(.secondaryLabel)

                        Text((checkedCarts.reduce(0) { $0 + ($1.product.totalPrice * $1.quantity) }).formattedCurrency)
                        .font(.title3.weight(.bold))
                        .foregroundColor(.label)
                    }
                    
                    Spacer()
                                        
                    Button("Checkout") {
                       showPINView = true
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
        .sheet(isPresented: $showPINView) {
            PINView(
                presenter: PINPresenter(
                    interactor: PINInteractor(),
                    isPresented: $showPINView
                )
            )
        }
        .navBarTitle("Keranjang")
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(
            presenter: CartPresenter(
                interactor: CartInteractor()
            )
        )
    }
}

