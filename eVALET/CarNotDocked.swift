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
    @IBOutlet var viewTrade: UIButton!
    @IBOutlet var cancelRequest: UIButton!
    
    //User Info
    @IBOutlet var nameField: UILabel!
    @IBOutlet var profilePic: UIImageView!
    
    //Number of spots
    @IBOutlet var spotsAvailableField: UILabel!
    
    //Request info
    @IBOutlet var requestImage: UIImageView!
    @IBOutlet var requestInfo: UILabel!
    
    
    var formatter = NSDateFormatter()
    
    //Variable to hold the number of available spots
    var numAvailable = 0
    
    //State of page, was a request made or a trade set up? Should never both be true, could both be false
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
    
    //Handle press of cancel request
    @IBAction func cancelRequestPressed(sender: AnyObject) {
        deleteRequest()
        NSUserDefaults.standardUserDefaults().setObject(false, forKey: "requestMade")
        confirmASpot.hidden = false
        makeARequest.hidden = false
        viewTrade.hidden = true
        cancelRequest.hidden = true
        requestImage.hidden = true
        requestInfo.hidden = true
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
        cancelRequest.layer.cornerRadius = 5
        viewTrade.layer.cornerRadius = 5
        
        //Hide unneccessary buttons
        cancelRequest.hidden = true
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
        getOccupiedSpaces({(count: Int32, error: NSError?) -> Void in
            if (error == nil)
            {
                if (count == 0) {
                    self.spotsAvailableField.text = "No spots available"
                } else {
                    self.spotsAvailableField.text = count.description + " spots available"
                }
            }
            else
            {
                print("Error")
            }
        })
        
        //Stuff to do if a request was made
        if (NSUserDefaults.standardUserDefaults().valueForKey("requestMade") != nil) {
            if (NSUserDefaults.standardUserDefaults().boolForKey("requestMade")) {
                confirmASpot.hidden = true
                makeARequest.hidden = true
                viewTrade.hidden = true
                cancelRequest.hidden = false
                requestImage.hidden = false
                requestInfo.hidden = false
                
                let start = NSUserDefaults.standardUserDefaults().valueForKey("requestStart") as! NSDate
                let end = NSUserDefaults.standardUserDefaults().valueForKey("requestEnd") as! NSDate
                formatter.timeStyle = .ShortStyle
                
                requestInfo.text = "Request from " + formatter.stringFromDate(start) + " to " + formatter.stringFromDate(end)
            }
        }
        
        //Stuff to do if a trade was set up
        if (tradeSetUp) {
            confirmASpot.hidden = true
            makeARequest.hidden = true
            cancelRequest.hidden = true
            viewTrade.hidden = false
            requestImage.hidden = true
            requestInfo.hidden = true
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
