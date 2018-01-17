//
//  ViewController2.swift
//  RaiBlock
//
//  Created by Carter Belisle on 1/6/18.
//  Copyright © 2018 Carter B. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    @IBOutlet var questionB: UIButton!
    @IBOutlet var descriptionLabel: UILabel!
    @IBAction func questionClicked(_ sender: Any) {
        self.descriptionLabel.text = "XRB has feeless and instant transactions!"
        self.questionB.setTitle("", for: .normal)
        
    }
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        
        
        
        
        
        
    }


}
