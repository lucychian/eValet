//
//  OccupiedSpace.swift
//  eVALET
//
//  Created by admin on 9/8/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import Foundation
import Parse

func createOccupiedSpace(stationId: String, batteryCharge: Int, block: PFBooleanResultBlock) {
    
    let newSpace = PFObject(className: "OccupiedSpace")
    newSpace["user"] = PFUser.currentUser()!
    newSpace["station"] = PFObject(withoutDataWithClassName: "Station", objectId: stationId)
    newSpace["batteryCharge"] = batteryCharge
    
    newSpace.saveInBackgroundWithBlock(block)
}



func getOccupiedSpaces(block: PFIntegerResultBlock) -> Void {
    let query = PFQuery(className:"OccupiedSpace")
    
    query.countObjectsInBackgroundWithBlock(block)
}



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
                getCurrentCharge({
                    (charge:Double) -> Void in
                    block(result:
                        ((car!["batterySize"] as! Double) - ((charge / 100) * (car!["batterySize"] as! Double))) / (car!["chargingRate"] as! Double))
                })
            })
        }
    })
}



func getCurrentCharge(block:(charge:Double)->Void) -> Void {
    
    let user = PFUser.currentUser()
    let query = PFQuery(className: "OccupiedSpace")
    query.whereKey("user", equalTo: user!)
    
    query.getFirstObjectInBackgroundWithBlock({
        (obj: AnyObject?, error: NSError?) -> Void in
        let car = user!["car"] as! PFObject
        car.fetchIfNeededInBackgroundWithBlock({
            (car: PFObject?, error: NSError?) -> Void in
            let date = obj!.createdAt as NSDate?
            let timeCharged = date!.timeIntervalSinceNow / -3600.0
            
            var percentage = obj!["batteryCharge"] as! Double + 100 * (timeCharged * (car!["chargingRate"] as! Double)) / (car!["batterySize"] as! Double)
            
            //full charge - return 100%
            if(percentage > 100) {
                percentage = 100
            }
            
            block(charge: percentage)
        })
    })
}