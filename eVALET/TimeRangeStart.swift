//
//  TimeRangeStart.swift
//  eVALET
//
//  Created by Drew Taylor on 12/31/14.
//  Copyright © 2014 Drew Taylor. All rights reserved.
//

import UIKit

class TimeRangeStart: UIViewController {

    //UI vars
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var availableStartTime: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Date picker setup
        datePicker.backgroundColor = UIColor.whiteColor()
        datePicker.minimumDate = NSDate()
        
        //Button styling
        availableStartTime.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if (identifier == "setStartTime") {
            NSUserDefaults.standardUserDefaults().setObject(datePicker.date, forKey: "requestStart")
        }
        
        return true
    }
}
