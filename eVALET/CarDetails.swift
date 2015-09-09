//
//  CarDetails.swift
//  eVALET
//
//  Created by Drew Taylor on 8/26/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class CarDetails: UIViewController {
    
    @IBOutlet var profilePic: UIImageView!

    @IBOutlet var nameField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePic.layer.borderColor = UIColor(red: 24/255, green: 129/255, blue: 198/255, alpha: 1).CGColor
        profilePic.layer.borderWidth = 2
        profilePic.layer.cornerRadius = 18
        profilePic.layer.masksToBounds = true
        
        nameField.text = NSUserDefaults.standardUserDefaults().objectForKey("firstName")! as? String
        nameField.text?.appendContentsOf(" ")
        nameField.text?.appendContentsOf((NSUserDefaults.standardUserDefaults().objectForKey("lastName")! as? String)!)
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
