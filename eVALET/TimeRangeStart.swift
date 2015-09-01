//
//  TimeRangeStart.swift
//  eVALET
//
//  Created by Drew Taylor on 12/31/14.
//  Copyright © 2014 Drew Taylor. All rights reserved.
//

import UIKit

class TimeRangeStart: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var availableStartTime: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.backgroundColor = UIColor.whiteColor()
        
        availableStartTime.layer.cornerRadius = 5

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
