//
//  StockCardView.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 15.04.2022.
//

import SwiftUI

struct StockCardView: View {
    let symbol: String
    let stock: Stock
    let networkState: NetworkState
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        CardView()
            .overlay(cardData)
            .padding()
            .animation(.default, value: networkState)
    }
}

struct StockCardView_Previews: PreviewProvider {
    static var previews: some View {
        StockCardView(symbol: "AAPL",
                      stock: Stock(c: 135, dp: 3),
                      networkState: .loadingError)
            .previewLayout(.sizeThatFits)
        
        StockCardView(symbol: "AAPL",
                      stock: Stock(c: 135, dp: -3),
                      networkState: .loadingError)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

//MARK: - StockCardExtansions

extension StockCardView {
    private var cardData: some View {
        VStack {
            switch networkState {
            case .loaded: stockData
            case .loadingError:
                Image(systemName: "questionmark.app")
                    .font(.system(size: height / 6))
                    .opacity(0.5)
            case .loading:
                ProgressView()
            }
        }
    }
}

extension StockCardView {
    private var stockData: some View {
        VStack(spacing: height / 30) {
            
            Text(stock.c != 0 ? symbol : "Wrong Symbol")
                .bold()
                .font(.system(size: height / 30))
            
            VStack {
                Text("\(String(stock.c ?? 0)) $")
                    .bold()
                    .font(.system(size: height / 30))
                
                Text(String(format: "%.2f", stock.dp ?? 0))
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: height / 35))
                    .frame(width: width - 100, height: height / 18)
                    .background(
                        stock.c == 0
                        ? Color.gray.opacity(0.8)
                        : stock.dp ?? 0 < 0
                        ? Color.red.opacity(0.8)
                        : Color.green.opacity(0.8)
                    )
                    .cornerRadius(10)
            }
        }
    }
}
