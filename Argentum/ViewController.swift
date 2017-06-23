//
//  ViewController.swift
//  Argentum
//
//  Created by Brian Ramirez on 6/22/17.
//  Copyright © 2017 Brian Ramirez. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UITableViewController {
    
    var cryptocurrencyArray = [Cryptocurrency]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getApiData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptocurrencyArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "currencyCell")
        cell.textLabel?.text = cryptocurrencyArray[indexPath.row].name
        
        return cell
    }
    
    func parseJSON(data:JSON){
        for i in 0...19 {
            let currency = data[i]
            
            let id = currency["id"].string
            let symbol = currency["symbol"].string
            let name = currency["name"].string
            let price = Double(currency["price_usd"].string!)
            let marketCap = Double(currency["market_cap_usd"].string!)
            let rank = Int(currency["rank"].string!)
            let totalSupply = Double(currency["total_supply"].string!)
            let percentChange = Double(currency["percent_change_1h"].string!)
            let lastUpdated = currency["last_updated"].string
            
            let object = Cryptocurrency(id: id!, symbol: symbol!, name: name!, image: nil, price: price!, marketCap: marketCap!, rank: rank!, totalSupply: totalSupply!, percentChange: percentChange!, lastUpdated: lastUpdated!)
            
            self.cryptocurrencyArray.append(object)
        }
        self.tableView.reloadData()
        print("Finished Loading.....")
    }


    func getApiData(){
        print("Loading....")
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                let json = JSON(data: data!)
                
                if(json != JSON.null){
                    self.parseJSON(data: json)
                }else{
                    print("Something went wrong and we couldn't parse shit")
                }
            }
            
        })
        task.resume()
    }//End of getApiData

}

