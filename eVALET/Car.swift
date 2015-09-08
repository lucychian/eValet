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

func setUserCar(evKey: String, block:PFBooleanResultBlock) -> Void{
    
    let user = PFUser.currentUser()
    user?["carId"] = evKey
    user?.saveInBackgroundWithBlock(block)
    
}


/*
getCarList
Get list of all cars stored in database.
Result:
    Returns BFTask with array of PFObjects containing car model and ID
*/

//func getCarList() -> BFTask{
//    
//    let query = PFQuery(className:"Cars")
//    query.selectKeys(["objectId","carModel"])
//    
//    return query.findObjectsInBackground()
//}

func getCarList(block: PFArrayResultBlock) -> Void {
    
    let query = PFQuery(className:"Cars")
    query.selectKeys(["objectId","carModel"])
    
    query.findObjectsInBackgroundWithBlock (block)
    
}


/*
getCarInfo
Parameter:
    userId - user ID of car owner
Result:
    Use car object in block
*/

func getCarInfo(user: PFUser, block: PFObjectResultBlock) -> Void {
    
    let query = PFQuery(className:"Cars")
    query.whereKey("objectId", equalTo: user["carId"]!)
    
    query.getFirstObjectInBackgroundWithBlock(block)
}
