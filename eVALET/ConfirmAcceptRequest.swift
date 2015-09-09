//
//  ConfirmAcceptRequest.swift
//  eVALET
//
//  Created by Drew Taylor on 8/31/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class ConfirmAcceptRequest: UIViewController {

    //UI vars
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var confirmTradeButton: UIButton!
    @IBOutlet var cancelTradeButton: UIButton!
    @IBAction func confirmTradeButton(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Date picker styling
        datePicker.backgroundColor = UIColor.whiteColor()
        
        //Button styling
        confirmTradeButton.layer.cornerRadius = 5
        cancelTradeButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
