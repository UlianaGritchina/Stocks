//
//  StocksListView.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 16.04.2022.
//

import SwiftUI

struct StocksListView: View {
    let vm: MainViewViewModel
    let height = UIScreen.main.bounds.height
    var body: some View {
        VStack {
            Text("Stocks")
                .bold()
                .font(.system(size: height / 50))
                .foregroundColor(.gray)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack() {
                    ForEach(vm.symbols.reversed(), id: \.self) { symbol in
                        StockCardView(symbol: symbol,
                                      stock: vm.stok,
                                      networkState: vm.network)
                            .onAppear {
                                vm.getStock(symbol: symbol, section: .stocks )
                            }
                    }
                }
            }
        }
    }
}

struct StocksListView_Previews: PreviewProvider {
    static var previews: some View {
        StocksListView(vm: MainViewViewModel())
    }
}
