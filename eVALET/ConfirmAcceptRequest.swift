//
//  ConfirmAcceptRequest.swift
//  eVALET
//
//  Created by Drew Taylor on 8/31/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class ConfirmAcceptRequest: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var confirmTradeButton: UIButton!
    
    @IBAction func confirmTradeButton(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.backgroundColor = UIColor.whiteColor()
        
        confirmTradeButton.layer.cornerRadius = 5
        
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
