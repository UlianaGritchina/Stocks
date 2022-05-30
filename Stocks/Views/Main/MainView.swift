//
//  ContentView.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 15.04.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject private var vm = MainViewViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    LineView()
                    FindStockView(symbol: $vm.TFSymbol)
                    StockCardView(symbol: vm.symbol,
                                  stock: vm.findedStok,
                                  networkState: vm.network)
                    LineView()
                    StocksListView(vm: vm)
                }
                .navigationTitle("Stocks")
                
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Find") { vm.findStock() }
                    }
                }
                .toolbar { ToolBarMenu(vm: vm) }

                .alert(isPresented: $vm.isShowingErrorAleret) {
                    Alert(title:
                            Text("Problem conection"),
                          message:
                            Text("Check your internet conection and try it again"),
                          primaryButton:
                            Alert.Button.default(Text("Cancel")),
                          secondaryButton:
                            Alert.Button.default(Text("Try again"),
                                                 action: {vm.update()})
                    )
                }
            }
        }
        .onTapGesture { vm.hideKeyboard() }
    }
}

struct StocksView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
        
        MainView()
            .preferredColorScheme(.dark)
        
    }
}

struct ToolBarMenu: View {
    let vm: MainViewViewModel
    var body: some View {
        Menu("Menu") {
            ForEach(vm.symbols, id: \.self) { sybol in
                Button(sybol) {
                    vm.menuButtonAction(symbol: sybol)
                }
            }
        }
    }
}
