//
//  CoinManager.swift
//  BitExchange
//
//  Created by Mateusz Uszyński on 18/09/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import UIKit

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "736DC5FA-6858-4413-BFD1-D3CB5AFFBA89"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        
    }
    
    func fetchCoin(currencyName: String) {
        let urlString = "\(baseURL)/\(currencyName)?apikey=\(apiKey)"
        performRequest(witg: urlString)
    }
    
    func performRequest(witg urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                
            }
            
            task.resume()
        }
        
    }
}
