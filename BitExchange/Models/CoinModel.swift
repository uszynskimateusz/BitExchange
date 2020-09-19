//
//  CoinModel.swift
//  BitExchange
//
//  Created by Mateusz Uszyński on 19/09/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import Foundation

struct CoinModel {
    let assetName: String
    let rateAsset: Double
    
    var rateAssetString: String {
        return String(format: "%.2f", rateAsset)
    }
}
