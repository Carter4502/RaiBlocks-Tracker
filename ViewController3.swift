//
//  ViewController3.swift
//  RaiBlock
//
//  Created by Carter Belisle on 1/6/18.
//  Copyright © 2018 Carter B. All rights reserved.
//

import Foundation
import UIKit

class ViewController3: UIViewController {
    @IBOutlet var webView: UIWebView!
    @IBAction func twitterClicked(_ sender: Any) {
        let Weburl = URL(string: "http://savage.ws/twitterRB.html")
        webView.loadRequest(URLRequest(url: Weburl!))
    }
    @IBAction func redditClicked(_ sender: Any) {
        let Weburl = URL(string: "http://savage.ws/redditRB.html")
        webView.loadRequest(URLRequest(url: Weburl!))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Weburl = URL(string: "http://savage.ws/redditRB.html")
        webView.loadRequest(URLRequest(url: Weburl!))
        
    }

    
}
