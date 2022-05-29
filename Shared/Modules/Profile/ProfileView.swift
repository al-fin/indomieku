//
//  ProfileView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var presenter: ProfilePresenter
    @ObservedObject var appState = AppState.shared

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                VStack {
                    Image(presenter.profile.avatar)
                        .resizable()
                        .frame(width: 125, height: 125)
                        .clipShape(Circle())
                        .border(width: 12, cornerRadius: 100, color: .accentColor)
                        .overlay {
                            ZStack(alignment: .bottomTrailing) {
                                Color.clear
                                Image("icon.badge")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35)
                                    .shadow(color: Color.accentColor.opacity(0.5), radius: 12, x: 0, y: 4)
                                    // custom positioning in the top-right corner
                                    .alignmentGuide(.trailing) { $0[.trailing] }
                            }
                        }
                    
                    Text(presenter.profile.name)
                        .font(.title2.weight(.bold))
                    Text("Member Gold")
                        .font(.body.weight(.light))
                }
                .padding()
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity)
                .foregroundColor(.secondarySystemBackground)
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color(hex: 0xFF9393), Color(hex: 0xF85D5D)]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                
                VStack {
                    BalanceInformationCard(
                        showButtons: true
                    )
                        .padding(.bottom)

                    PersonalInformation(
                        items: [
                            Item(key: "ID Pengguna", value: presenter.profile.userID),
                            Item(key: "Nama Lengkap", value: presenter.profile.name),
                            Item(key: "Email", value: presenter.profile.email),
                            Item(key: "No HP", value: presenter.profile.phone),
                            Item(key: "Alamat", value: presenter.profile.address)
                        ]
                    )

                    Divider()
                        .background(Color.tertiaryLabel)
                    
                    Group {
                        HStack {
                            Group {
                                Image("icon.lock")
                                    .renderingMode(.template)
                                Text("PIN")
                                    .font(.body.weight(.semibold))
                            }
                            .foregroundColor(Color.label)
                            
                            Spacer()
                            
                            Text("•••••••••••")
                                .font(.body.weight(.regular))
                                .foregroundColor(.secondaryLabel)
                        }

                        Divider()
                            .background(Color.tertiaryLabel)

                        HStack {
                            Group {
                                Image("icon.dark")
                                    .renderingMode(.template)
                                Text("Theme")
                                    .font(.body.weight(.semibold))
                            }
                            .foregroundColor(Color.label)

                            Spacer()

                            Picker("Theme", selection: $appState.theme) {
                                Text("Auto").tag(AppTheme.auto)
                                Text("Light").tag(AppTheme.light)
                                Text("Dark").tag(AppTheme.dark)
                            }
                            .pickerStyle(.segmented)
                            .frame(maxWidth: 200)
                            .onChange(of: appState.theme, perform: { value in
                                appState.updateTheme()
                            })
                        }

                        Divider()
                            .background(Color.tertiaryLabel)
                        
                        HStack {
                            Group {
                                Image("icon.logout")
                                    .renderingMode(.template)
                                Text("Keluar Akun")
                                    .font(.body.weight(.semibold))
                                    .onTapGesture {
                                        presenter.logout()
                                    }
                            }
                            .foregroundColor(Color.accentColor)
                            
                            Spacer()
                            
                            Text("Versi 1.0.0")
                                .font(.caption.weight(.regular))
                                .foregroundColor(.tertiaryLabel)
                        }
                    }
                }
                .padding(.horizontal)
                .offset(y: -50)
                .background(Color.secondarySystemBackground)
            }
        }
        .background(Color(hex: 0xFF9393))
        .overlay(alignment: .top) {
            Color(hex: 0xFF9393)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 0) // constrain the overlay to above the top safe area
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            presenter: ProfilePresenter(
                interactor: ProfileInteractor()
            )
        )
    }
}
