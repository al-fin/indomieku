//
//  SaleProgress.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 21/05/22.
//

import SwiftUI

struct SaleProgress: View {
    var value: CGFloat
    var min: CGFloat
    var max: CGFloat
    var height: Double
    
    init(
        value: Int = 0,
        min: Int = 0,
        max: Int = 100,
        height: Double = 10
    ) {
        self.value = CGFloat(value)
        self.min = CGFloat(min)
        self.max = CGFloat(max)
        self.height = height
    }
    
    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.label.opacity(0.15))
                    .frame(width: metrics.size.width, height: height)
                
                ZStack(alignment: .bottomTrailing) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color(hex: 0xFF8E8E), Color(hex: 0xF85D5D)]
                                ),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(
                            width: metrics.size.width * ((self.value-self.min) / (self.max-self.min)),
                            height: height
                        )
                    
                    VStack(alignment: .trailing) {
                        Image("icon.fire")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                    }
                    .frame(width: 20, height: 20)
                    .offset(x: 5)
                }
            }
        }
        .frame(height: height*1.5)
    }
}

struct SaleProgress_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            SaleProgress(
                value: 50,
                min: 0,
                max: 100
            )
            
            Text("Sale Progress View")
        }
        .padding()
    }
}
