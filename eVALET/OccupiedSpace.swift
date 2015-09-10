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
                block(result:(car!["batterySize"] as! Double) * ((100 - (spot["batteryCharge"] as! Double))/100) / (car!["chargingRate"] as! Double))
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
        getChargeTime({
            (result: Double)->Void in
            let date = obj!.createdAt as NSDate?
            let timeCharged = date!.timeIntervalSinceNow / -3600.0
            print(result)
            print(timeCharged)
            print(obj!["batteryCharge"] as! Int)
            //full charge - return 100%
            if( result - timeCharged < 0) {
                block(charge: 100)
            }
                //still charging - add % charged to initial battery %
            else {
                block(charge: 100 - (100 * ((result - timeCharged)/result)) + (obj!["batteryCharge"] as! Double))
            }
        })
    })
}