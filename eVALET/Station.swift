//
//  Station.swift
//  eVALET
//
//  Created by Lucy Chian on 9/4/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import Foundation
import Parse


/*
getStationList
Return:
List of station names paired with ID
*/

func getStationList(block: PFArrayResultBlock) -> Void {
    let query = PFQuery(className:"Station")
    query.selectKeys(["objectId","stationName"])
    
    query.findObjectsInBackgroundWithBlock(block)
}


func getUserStation(block: PFObjectResultBlock) -> Void {
    let query = PFQuery(className: "OccupiedSpace")
    query.whereKey("user", equalTo: PFUser.currentUser()!)
    
    query.getFirstObjectInBackgroundWithBlock(block)
}