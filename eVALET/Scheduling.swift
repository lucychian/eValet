//
//  Scheduling.swift
//  eVALET
//
//  Created by Lucy Chian on 9/9/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import Foundation
import Parse

func getChargeTime(block:(result:Double)->Void) -> Void {
    
    let query = PFQuery(className: "OccupiedSpace")
    query.whereKey("user", equalTo: PFUser.currentUser()!)
    
    query.getFirstObjectInBackgroundWithBlock({
        (obj:AnyObject?, error:NSError?) -> Void in
        if let spot = obj {
            let user = spot["user"] as! PFUser
            let car = user["car"] as! PFObject
            car.fetchIfNeededInBackgroundWithBlock({
                (car:PFObject?, error:NSError?) -> Void in
                block(result:(car!["batterySize"] as! Double) * ((100 - (spot["batteryCharge"] as! Double))/100) / (car!["chargingRate"] as! Double))
            })
            
        }
    })
}