//
//  DeliveryInformation.swift
//  Indomieku (iOS)
//
//  Created by Alfin on 28/05/22.
//

import SwiftUI

struct DeliveryInformation: View {
    var transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Info Pengiriman")
                .font(.body.weight(.semibold))
                .foregroundColor(.accentColor)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Kurir")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.label)
                    
                    Text(transaction.delivery.courier)
                        .font(.body.weight(.light))
                        .foregroundColor(.secondaryLabel)
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Qty")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.label)
                    
                    Text("\(transaction.delivery.price.formattedCurrency)")
                        .font(.body.weight(.light))
                        .foregroundColor(.secondaryLabel)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("No Resi")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.label)
                    
                    Text(transaction.delivery.trackingID)
                        .font(.body.weight(.light))
                        .foregroundColor(.secondaryLabel)
                }
            }
            
            // timeline
            
            VLine()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [10]))
                .frame(width: 1, height: 100)
        }
    }
}



struct VLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        return path
    }
}
