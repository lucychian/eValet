//
//  Car.swift
//  eVALET
//
//  Created by Lucy Chian on 9/2/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import Foundation
import Parse

/*
setCar
Parameters:
    evKey - key for user's electric vehicle
Return:
    Bool - true if car is successfully set, false otherwise
*/

func setUserCar(evKey: Int) -> Bool{
    
    let user = PFUser.currentUser()
    user?["carId"] = evKey
    user?.saveInBackground()
    if(user != nil) {
        return true
    } else {
        return false
    }
    
}


/*
getCarList
Return:
    NSArray of Car objects, nil if query fails
*/

func getCarList(callback: ([PFObject]?) -> Void) -> Void{
    
    var carList: [AnyObject] = []
    let query = PFQuery(className:"Cars")
    query.selectKeys(["objectId","carModel"])
    
    query.findObjectsInBackgroundWithBlock {
        (objects: [AnyObject]?, error: NSError?) -> Void in
        
        if error == nil {
            // The find succeeded.
            if let objects = objects as? [PFObject] {
                callback(objects)
            }
        } else {
            // Log details of the failure
            print("Error: \(error!) \(error!.userInfo)")
        }
    }
  
    return
}