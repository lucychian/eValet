//
//  CarNotDocked.swift
//  eVALET
//
//  Created by Drew Taylor on 9/1/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class CarNotDocked: UIViewController {

    @IBOutlet var confirmASpot: UIButton!
    
    @IBOutlet var makeARequest: UIButton!
    
    @IBOutlet var viewExistingRequest: UIButton!
    
    @IBOutlet var nameField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmASpot.layer.cornerRadius = 5
        
        makeARequest.layer.cornerRadius = 5
        
        viewExistingRequest.layer.cornerRadius = 5
        
        nameField.text = NSUserDefaults.standardUserDefaults().objectForKey("firstName")! as? String
        nameField.text?.appendContentsOf(" ")
        nameField.text?.appendContentsOf((NSUserDefaults.standardUserDefaults().objectForKey("lastName")! as? String)!)
        
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
