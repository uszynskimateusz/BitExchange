//
//  CoinManager.swift
//  BitExchange
//
//  Created by Mateusz Uszyński on 18/09/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import UIKit

protocol CoinManagerDelegate {
    func didUpdateCoin(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "736DC5FA-6858-4413-BFD1-D3CB5AFFBA89"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let coinPrice = self.parseJSON(safeData) {
                        let priceString = String(format: "%.2f", coinPrice)
                        self.delegate?.didUpdateCoin(price: priceString, currency: currency)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try  decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            
            return rate
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
