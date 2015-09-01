//
//  TimeRangeEnd.swift
//  eVALET
//
//  Created by Drew Taylor on 9/1/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class TimeRangeEnd: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var availableEndTime: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        availableEndTime.layer.cornerRadius = 5
        
        datePicker.backgroundColor = UIColor.whiteColor()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
