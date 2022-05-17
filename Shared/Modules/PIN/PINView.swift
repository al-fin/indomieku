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
                Image("lock")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                
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
        PINView(presenter: PINPresenter(interactor: PINInteractor()))
    }
}
