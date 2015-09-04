//
//  ParseRequest.swift
//  eVALET
//
//  Created by Pooja Rajkumar on 9/3/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit
import Parse
import Bolts

// ******* THERE MUST BE A USER OBJECT LOGGED IN THE PARSE TABLE IN ORDER FOR THIS CODE TO WORK *************

class ParseRequest: UIViewController {

    @IBAction func ParseRequestButton(sender: AnyObject) {
    // Here we will make a parse request
//        PFUser.logInWithUsernameInBackground("Mock User", password:"password") {
//            (user: PFUser?, error: NSError?) -> Void in
//            if user != nil {
//                // Do stuff after successful login.
//                print("Log in successful")
//            } else {
//                // The login failed. Check error to see why.
//                print("Failed Log in");
//            }
//        }
//        
//        userCheckIn(10, spotID: "1000XY")
//        
//   

    }
    
    /* Set the battery percentage and send it to parse
        Parameters: User Inputted Battery % (integer)
                  : Spot #
*/
    
    func userCheckIn(batteryPercent:Int, spotID:String) {
        //let  batteryPercent = 10;
        //let spotID = "100XY";
        let currentUser = PFUser.currentUser()
        let update = PFObject(className:"OccupiedSpace");
        
        
        update["batteryCharge"] = batteryPercent
        update["stationId"] = spotID
        update["userId"] = currentUser?.objectId
        
        update.saveInBackgroundWithBlock{
            (success: Bool, error: NSError?) -> Void in
            if(success) {
                print("Success")
            } else {
                print("Error")
            }
        }
//       let currentUser = PFUser.currentUser()
//       let update = PFObject(className:"OccupiedSpace");
//        
//        update["batteryCharge"] = batteryPercent
//        update["stationID"] = spotID
//        update["userID"] = currentUser?.objectId
//        
//        update.saveInBackgroundWithBlock{
//            (success: Bool, error: NSError?) -> Void in
//            if(success) {
//                print("The object has been saved");
//            } else {
//                print("Error");
//            }
//        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
