//
//  Trade.swift
//  eVALET
//
//  Created by admin on 9/10/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import Foundation
import Parse


func getTrade(block: PFObjectResultBlock) {
    
    let reqQuery = PFQuery(className:"Request")
    let spaceQuery = PFQuery(className:"OccupiedSpace")
    
    let user = PFUser.currentUser()
    
    reqQuery.whereKey("user", equalTo: user!)
    spaceQuery.whereKey("user", equalTo: user!)
    
    let query = PFQuery(className: "Exchange")
    query.whereKey("request", matchesQuery: reqQuery)
    query.whereKey("occupiedSpace", matchesQuery: spaceQuery)
    
    query.getFirstObjectInBackgroundWithBlock(block)
}