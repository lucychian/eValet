//
//  ConfirmTimeRange.swift
//  eVALET
//
//  Created by Drew Taylor on 9/1/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class ConfirmTimeRange: UIViewController {

    //UI vars
    @IBOutlet var confirmTimeRange: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Button styling
        confirmTimeRange.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
