//
//  Request.swift
//  eVALET
//
//  Created by Lucy Chian on 9/3/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import Foundation
import Parse

/*
createRequest
Parameters:
    start - time user making request is available from
    end - time user making request is available until
Return:
    Bool - true if request is successfully created, false otherwise
*/

func createRequest(start:NSDate, end:NSDate) -> Bool{
    
    let request = PFObject(className:"Request")
    request["availableStart"] = start
    request["availableEnd"] = end
    
    return request.saveInBackground().completed

}


/*
getRequests
Result:
    Returns BFTask with PFObject containing user's ID, available start time, and available end time
    ordered from least to most recent of unfulfilled requests
*/

func getRequests() -> BFTask{
    
    let query = PFQuery(className:"Request")
    query.whereKey("fulfilled", equalTo: false)
    query.orderByAscending("createdAt")
    return query.findObjectsInBackground()
    
}
