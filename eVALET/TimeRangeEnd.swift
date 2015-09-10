//
//  TimeRangeEnd.swift
//  eVALET
//
//  Created by Drew Taylor on 9/1/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class TimeRangeEnd: UIViewController {

    //UI vars
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var availableEndTime: UIButton!
    @IBOutlet var startTime: UILabel!
    
    //Date setup
    var start: NSDate!
    var formatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Formate date and assign to start time text
        formatter.timeStyle = .ShortStyle
        startTime.text = formatter.stringFromDate(start)
        
        //Button styling
        availableEndTime.layer.cornerRadius = 5
        
        //Date picker setup
        datePicker.backgroundColor = UIColor.whiteColor()
        datePicker.minimumDate = start
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
