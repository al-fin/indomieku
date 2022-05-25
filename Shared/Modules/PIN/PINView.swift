//
//  PINView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct PINView: View {
    @ObservedObject var presenter: PINPresenter

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [Color(hex: 0xFF8484), Color(hex: 0xE31F1F)]
                ),
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image("icon.lock")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .padding(12)
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(50)
                    .border(width: 1, cornerRadius: 50, color: Color.white)
                    .padding(.top, 20)
                
                VStack {
                    Text("Autentikasi Pembayaran")
                        .font(.title3.weight(.bold))
                        .multilineTextAlignment(.center)
                    Text("Silahkan masukkan PIN kamu!")
                        .font(.title3.weight(.light))
                }
                
                PINDots(value: presenter.pin)
                
                PinKeyboard
                
                Spacer()
                
                Text("Lupa PIN?")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondaryColor)
            }
            .padding()
            .foregroundColor(.white)
            .navBarHidden(true)
        }
    }
    
    var PinKeyboard: some View {
        GridStack(rows: 4, columns: 3) { row, col in
            let index = (row+1 * col+1) + (row*2)
            let num = index == 11 ? 0 : index
            
            if index == 10 {
                Image(systemName: "faceid")
                    .font(.title)
                    .frame(width: 100, height: 100)
            } else if index == 12 {
                Button(action: {
                    presenter.onDeletePIN()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .font(.title)
                        .frame(width: 100, height: 100)
                })
            } else {
                Button("\(num)") {
                    presenter.onInputPIN(num)
                }
                .font(.title.weight(.bold))
                .frame(width: 100, height: 100)
            }
        }
    }
}

struct PINView_Previews: PreviewProvider {
    static var previews: some View {
        @State var showPINView = true
        return PINView(
            presenter: PINPresenter(
                interactor: PINInteractor(),
                isPresented: $showPINView
            )
        )
    }
}
