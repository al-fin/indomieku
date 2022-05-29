//
//  NotificationPresenter.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 11/05/22.
//

import Foundation
import SwiftUI

protocol NotificationPresenterProtocol {
    var interactor: NotificationInteractor { get }
    
    var notifications: [Notification] { get }
}

final class NotificationPresenter: NotificationPresenterProtocol, ObservableObject {
    internal let interactor: NotificationInteractor
    
    let appState = AppState.shared
    
    let notifications: [Notification] = [
        Notification(
            id: 1,
            type: .delivery,
            title: "PENGIRIMAN",
            content: "Selamat pesanan kamu sudah sampai! Berikan ulasan untuk mendapatkan bonus saldo iFoodPay.",
            date: "2022-05-22T07:30:00".convertToDate()
        ),
        Notification(
            id: 2,
            type: .payment,
            title: "PEMBAYARAN",
            content: "Pembayaran kamu sudah kami terima, pesanan kamu akan segera diantar.",
            date: "2022-05-22T07:00:00".convertToDate()
        ),
        Notification(
            id: 3,
            type: .info,
            title: "INFORMASI",
            content: "Selamat! akun kamu sudah terverifikasi! Kamu sudah bisa menggunakan akunmu untuk bertransaksi.",
            date: "2022-05-01T12:00:00".convertToDate()
        ),
    ]

    init(interactor: NotificationInteractor) {
        self.interactor = interactor
    }    
}
