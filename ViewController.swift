//
//  ViewController.swift
//  RaiBlock
//
//  Created by Carter Belisle on 1/5/18.
//  Copyright © 2018 Carter B. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var LMView: UIView!
    @IBOutlet var viewBTC: UIView!
    @IBOutlet var supplyView: UIView!
    @IBOutlet var HighView: UIView!
    @IBOutlet var priceBtc: UILabel!
    @IBOutlet var marketCap: UILabel!
    @IBOutlet var high: UILabel!
    @IBOutlet var low: UILabel!
    @IBOutlet var change7d: UILabel!
    @IBOutlet var supply: UILabel!
    @IBOutlet var market: UILabel!
    
    @IBOutlet var change7DView: UIView!
    @IBOutlet var LowView: UIView!
    @IBOutlet var MCView: UIView!
    @IBOutlet var changeLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    var refreshControl: UIRefreshControl!
    override func viewDidLoad() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(doSomething), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        viewBTC.layer.cornerRadius = 10
        supplyView.layer.cornerRadius = 10
        HighView.layer.cornerRadius = 10
        LowView.layer.cornerRadius = 10
        MCView.layer.cornerRadius = 10
        change7DView.layer.cornerRadius = 10
        LMView.layer.cornerRadius = 10
        getStats()
    }
        
        func getStats(){
        let jsonUrlString = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=XRB&tsyms=USD,BTC"
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, err) in
            guard let data = data else {return}
            do {
                let dataAsString = (String(data: data, encoding: .utf8))!
                let x = self.convertToDictionary(text: dataAsString)
                let raw = x!["RAW"]!
                let raw2 = raw as! NSDictionary
                let xrb = raw2["XRB"]
                let xrbDic = xrb as! NSDictionary
                let usd = xrbDic["USD"]
                let btc = xrbDic["BTC"]
                let btcDic = btc as! NSDictionary
                let usdDic = usd as! NSDictionary
                let priceHigh = usdDic["HIGH24HOUR"]! as? String
                let priceHighI = Double(priceHigh!)
                let priceHighR = round(priceHighI!, toNearest: 0.01)
                let change7Days = usdDic["TOTALVOLUME24H"]! as? Double
                let volumeAsD = Double(change7Days!)
                let roundedV = round(volumeAsD, toNearest: 0.1)
                
                let priceLow = usdDic["LOW24HOUR"]! as? String
                let priceLowI = Double(priceLow!)
                let priceLowR = round(priceLowI!, toNearest: 0.01)
                let supply = usdDic["SUPPLY"]!
                let marketCap = usdDic["MKTCAP"]! as? Double
                let marketCapRound = round(marketCap!, toNearest: 1)
                let lastExchange = usdDic["LASTMARKET"]! as! String
                let changePercent = usdDic["CHANGEDAY"]! as? Double
                let roundedPCTChange = round(changePercent!, toNearest: 0.01)
                let changeUSD = usdDic["CHANGEPCTDAY"]! as? Double
                let roundedUSDChange = round(changeUSD!, toNearest: 0.01)
                let btcPrice = btcDic["PRICE"]!
                let USDPrice = usdDic["PRICE"]! as? String
                let priceInt = Double(USDPrice!)
                let priceusd = round(priceInt!, toNearest: 0.01)
                
                DispatchQueue.main.async {
                    self.priceLabel.text = "$\(priceusd)"
                    if (roundedUSDChange > 0) {
                        self.changeLabel.text = "\(roundedUSDChange)" + "% ($" + "\(roundedPCTChange)" + ")"
                    }
                    else {
                        self.changeLabel.textColor = UIColor.red
                        self.changeLabel.text = "\(roundedUSDChange)" + "% ($" + "\(roundedPCTChange)" + ")"
                    }
                    self.priceBtc.text = "\(btcPrice)"
                    self.low.text = "$\(priceLowR)"
                    self.high.text = "$\(priceHighR)"
                    self.marketCap.text = "\(marketCapRound)"
                    self.supply.text = "\(supply)"
                    self.market.text = lastExchange
                    self.change7d.text = "\(roundedV)"
                }
            }
           
            
            }.resume()
        
        
    }
    @objc func doSomething(refreshControl: UIRefreshControl) {
        getStats()
        refreshControl.endRefreshing()
    }
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

func round(_ value: Double, toNearest: Double) -> Double {
    return round(value / toNearest) * toNearest
}
