//
//  PlaygroundView.swift
//  Indomieku
//
//  Created by Alfin on 18/05/22.
//

import SwiftUI

struct PlaygroundView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in CGFloat(position) * 10 }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

struct PlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundView()
    }
}
