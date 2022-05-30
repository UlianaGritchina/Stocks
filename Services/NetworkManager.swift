//
//  NetworkManager.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 25.05.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchStock(url: URL, completionHandler: @escaping (_ stock: Stock?, _ networkState: NetworkState) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error  in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                      print("Error downloading data")
                      completionHandler(nil, .loadingError)
                      return
                  }
            
            guard let newStock = try? JSONDecoder().decode(Stock.self, from: data) else { return }
            
            completionHandler(newStock, .loaded)
            
        }.resume()
    }
    
}
