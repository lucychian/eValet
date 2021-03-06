//
//  ChargingDetails.swift
//  eVALET
//
//  Created by Drew Taylor on 8/26/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class ChargingDetails: UIViewController {

    //Charge info
    @IBOutlet var stationNumber: UILabel!
    @IBOutlet var stationLocation: UILabel!
    
    //Passed info
    var passedStation: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set charge info to passed info
        stationNumber.text = "Station #" + passedStation
        
        if (passedStation.containsString("SJC-10")) {
            stationLocation.text = "Building 10"
        } else {
            stationLocation.text = "Garage"
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
