//
//  Cryptocurrency.swift
//  Argentum
//
//  Created by Brian Ramirez on 6/22/17.
//  Copyright © 2017 Brian Ramirez. All rights reserved.
//

import Foundation
import UIKit
class Cryptocurrency {
    
    var id: String
    var symbol: String
    var name: String
    var image: UIImage?
    var price: Double
    var marketCap: Double
    var rank: Int
    var totalSupply: Double
    var percentChange: Double
    var lastUpdated: String
    

    init(id: String,symbol: String, name:String, image:UIImage?, price:Double, marketCap:Double, rank:Int, totalSupply: Double, percentChange:Double, lastUpdated:String) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.image = image
        self.price = price
        self.marketCap = marketCap
        self.rank = rank
        self.totalSupply = totalSupply
        self.percentChange = percentChange
        self.lastUpdated = lastUpdated
        
    }
    
}
