//
//  CarNotDocked.swift
//  eVALET
//
//  Created by Drew Taylor on 9/1/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit
import Foundation
import Parse

class CarNotDocked: UIViewController {

    //Buttons
    @IBOutlet var confirmASpot: UIButton!
    @IBOutlet var makeARequest: UIButton!
    @IBOutlet var viewRequest: UIButton!
    @IBOutlet var viewTrade: UIButton!
    
    //User Info
    @IBOutlet var nameField: UILabel!
    @IBOutlet var profilePic: UIImageView!
    
    //Number of spots
    @IBOutlet var spotsAvailableField: UILabel!
    
    //Variable to hold the number of available spots
    var numAvailable = 10
    
    //State of page, was a request made or a trade set up? Should never both be true, could both be false
    var requestMade = false
    var tradeSetUp = false
    
    //Alert pop up
    var alert = UIAlertView()
    var about = UIAlertView()

    //Handle press of settings button
    @IBAction func settingsButtonPressed(sender: AnyObject) {
        alert.delegate = self
        
        alert.title = "Settings"
        alert.addButtonWithTitle("About")
        alert.addButtonWithTitle("Sign Out")
        alert.addButtonWithTitle("Cancel")
        alert.show()
    }
    
    //Handle alert view button actions for settings
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex{
        case 0:
            about.title = "About"
            about.message = "eVALET app made for Cisco GIS by Lucy Chian, Jacob Copus, Pooja Rajkumar, and Drew Taylor. Thanks for using the app!"
            about.addButtonWithTitle("Close")
            about.show()
        case 1:
            PFUser.logOutInBackground()
            NSUserDefaults.standardUserDefaults().setObject(false, forKey: "loggedIn")
            self.performSegueWithIdentifier("signOut", sender: self)
        case 2:
            alert.endEditing(true)
        default:
            print("Error in alert selection.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button styling
        confirmASpot.layer.cornerRadius = 5
        makeARequest.layer.cornerRadius = 5
        viewRequest.layer.cornerRadius = 5
        viewTrade.layer.cornerRadius = 5
        
        //Hide unneccessary buttons
        viewRequest.hidden = true
        viewTrade.hidden = true
        
        //Set up user information
        nameField.text = NSUserDefaults.standardUserDefaults().objectForKey("firstName")!.description + " " + NSUserDefaults.standardUserDefaults().objectForKey("lastName")!.description
        
        //Get user photo
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = documentsPath.NS.stringByAppendingPathComponent("evaletProfile.jpg")
        profilePic.image = UIImage(contentsOfFile: destinationPath)
        
        //User photo styling
        profilePic.layer.borderColor = UIColor(red: 24/255, green: 129/255, blue: 198/255, alpha: 1).CGColor
        profilePic.layer.borderWidth = 2
        profilePic.layer.cornerRadius = 18
        profilePic.layer.masksToBounds = true
        
        //Change number of available spots text
        if (numAvailable == 0) {
            spotsAvailableField.text = "No spots available."
        } else {
            spotsAvailableField.text = numAvailable.description + " spots available."
        }
        
        //Stuff to do if a request was made
        if (requestMade) {
            confirmASpot.hidden = true
            makeARequest.hidden = true
            viewTrade.hidden = true
            viewRequest.hidden = false
        }
        
        //Stuff to do if a trade was set up
        if (tradeSetUp) {
            confirmASpot.hidden = true
            makeARequest.hidden = true
            viewRequest.hidden = true
            viewTrade.hidden = false
            makeARequest.setTitle("View Trade", forState: .Normal)
        }
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
