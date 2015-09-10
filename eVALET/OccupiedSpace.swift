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
    newSpace["user"] = PFUser.currentUser()
    newSpace["station"] = PFObject(withoutDataWithClassName: "Station", objectId: stationId)
    newSpace["batteryCharge"] = batteryCharge
    
    newSpace.saveInBackgroundWithBlock(block)
}