//
//  LoadingView.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 14/05/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 10) {
            ProgressView()
            Text("TUNGGU SEBENTAR")
                .font(.caption)
                .foregroundColor(.secondaryLabel)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
