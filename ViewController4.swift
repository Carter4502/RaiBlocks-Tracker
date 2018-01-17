//
//  ViewController4.swift
//  RaiBlock
//
//  Created by Carter Belisle on 1/7/18.
//  Copyright © 2018 Carter B. All rights reserved.
//

import Foundation
import UIKit

class ViewController4: UIViewController {
    

    @IBAction func yearClicked(_ sender: Any) {
        let Weburl = URL(string: "http://savage.ws/RBYearGraph.html")
        webView.loadRequest(URLRequest(url: Weburl!))
    }
    
    
    @IBAction func monthClicked(_ sender: Any) {
        let Weburl = URL(string: "http://savage.ws/RBMonthGraph.html")
        webView.loadRequest(URLRequest(url: Weburl!))
    }
    @IBAction func weekClicked(_ sender: Any) {
        let Weburl = URL(string: "http://savage.ws/RBWeekGraph.html")
        webView.loadRequest(URLRequest(url: Weburl!))
    }
    
    @IBAction func dayClicked(_ sender: Any) {
        let Weburl = URL(string: "http://savage.ws/RBDayGraph.html")
        webView.loadRequest(URLRequest(url: Weburl!))
    }
    @IBOutlet var yearButton: UIButton!
    @IBOutlet var monthButton: UIButton!
    @IBOutlet var weekButton: UIButton!
    @IBOutlet var dayButton: UIButton!
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        yearButton.layer.cornerRadius = 10
        monthButton.layer.cornerRadius = 10
        weekButton.layer.cornerRadius = 10
        dayButton.layer.cornerRadius = 10
        let Weburl = URL(string: "http://savage.ws/RBDayGraph.html")
        webView.loadRequest(URLRequest(url: Weburl!))
    }

    
    
    
    
    
}
