//
//  StockViewViewModel.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 15.04.2022.
//

import SwiftUI

enum Section {
    case findStock
    case stocks
}

enum NetworkState {
    case loaded
    case loadingError
    case loading
}

class MainViewViewModel: ObservableObject {
    
    @Published var findedStok: Stock = Stock(c: 0, dp: 0)
    @Published var stok: Stock = Stock(c: 0, dp: 0)
    @Published var TFSymbol = "AAPL"
    @Published var symbol = "AAPL"
    @Published var network: NetworkState = .loading
    @Published var isShowingErrorAleret = false
    
    let symbols = ["AAPL", "TWTR", "KO", "NKE", "HUSA", "MSFT", "CAT", "INDO", "MDVL", "SNAP"]
    private let baseUrl = "https://finnhub.io/api/v1/quote?symbol="
    private let token = "&token=sandbox_c8sosj2ad3ifkeaobvi0"
    
    init () {
        update()
    }
    
    func update() {
        getStock(symbol: symbol, section: .findStock)
        getStock(symbol: symbol, section: .stocks)
    }
    
    func findStock() {
        hideKeyboard()
        getStock(symbol: TFSymbol, section: .findStock)
        symbol = TFSymbol
    }
    
    func menuButtonAction(symbol: String) {
        TFSymbol = symbol
        findStock()
    }
    
    func hideKeyboard() {
        UIApplication.shared.endEditing()
    }
    
    func getStock(symbol: String, section: Section) {
        guard let url = URL(string: "\(baseUrl)\(symbol)\(token)") else { return }
        NetworkManager.shared.fetchStock(url: url) { stock, networkState in
            DispatchQueue.main.async {
                if let stock = stock {
                    section == .findStock ? (self.findedStok = stock) : (self.stok = stock)
                }
                self.network = networkState
                if networkState == .loadingError {
                    self.isShowingErrorAleret = true
                }
            }
        }
    }
    
}
