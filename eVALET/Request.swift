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

func createRequest(start:NSDate, end:NSDate, block: PFBooleanResultBlock) -> Void{
    
    let request = PFObject(className:"Request")
    request["availableStart"] = start
    request["availableEnd"] = end
    request["user"] = PFUser.currentUser()!
    
    request.saveInBackgroundWithBlock(block)
    
}

/*
deleteRequest
*/

func deleteRequest() -> Void{
    
    let user = PFUser.currentUser()
    
    let query = PFQuery(className: "Request")
    query.whereKey("user", equalTo: user!)
    query.getFirstObjectInBackgroundWithBlock{(obj: AnyObject?, err: NSError?) -> Void in
        
        if err == nil && obj != nil {
            obj?.deleteInBackground()
            
        } else {
            print("Error")
        }
    }
}


/*
getRequests
Result:
Returns PFObject containing user's ID, available start time, and available end time
ordered from least to most recent of unfulfilled requests
*/

func getRequests(block: PFArrayResultBlock) -> Void {
    
    let query = PFQuery(className:"Request")
    query.whereKey("fulfilled", equalTo: false)
    query.orderByAscending("createdAt")
    
    query.findObjectsInBackgroundWithBlock(block)
    
}
