//
//  LoginView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var presenter: LoginPresenter
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [Color(hex: 0xFF8484), Color(hex: 0xE31F1F)]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                
                VStack(alignment: .leading) {
                    Text("Selamat Datang,")
                        .font(.title3.weight(.bold))
                    Text("Silahkan masuk dulu ya..")
                        .font(.title3.weight(.light))
                }
                .foregroundColor(.white)
                
                
                VStack(spacing: 10) {
                    CustomTextField(
                        label: "Alamat Email",
                        text: $presenter.email,
                        size: .large,
                        theme: .light
                    )
                    
                    CustomTextField(
                        type: .password,
                        label: "Kata Sandi",
                        text: $presenter.password,
                        endIcon: "eye.slash.fill",
                        size: .large,
                        theme: .light
                    )
                }

                VStack(spacing: 20) {
                    Button(presenter.isLoading ? "Loading..." : "Masuk", action: presenter.onLoginTapped)
                        .buttonStyle(PrimaryButton())

                    LabelledDivider("Belum punya akun?")
                    
                    Button("Daftar Sekarang", action: presenter.onRegisterTapped)
                        .buttonStyle(GlassButton())
                }
                
                Spacer()
            }
            .padding()
            .navBarHidden(true)
        }
    }
}


struct LoginView_Previews: PreviewProvider {    
    static var previews: some View {
        LoginView(
            presenter: LoginPresenter(
                interactor: LoginInteractor()
            )
        )
    }
}
