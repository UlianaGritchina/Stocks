//
//  FindStockView.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 15.04.2022.
//

import SwiftUI

struct FindStockView: View {
    @Binding var symbol: String
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        VStack {
            Text("Find stock")
                .bold()
                .font(.system(size: height / 50))
            .foregroundColor(.gray)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: width - 40, height: height / 15)
                .withCardFormatting()
                .overlay(
                    TextField("Symblol", text: $symbol)
                        .font(.system(size: height / 30))
                        .padding()
                )
        }
    }
}

struct FindStockView_Previews: PreviewProvider {
    static var previews: some View {
        FindStockView(symbol: .constant("AAPL"))
            .previewLayout(.sizeThatFits)
        
        FindStockView(symbol: .constant("AAPL"))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
