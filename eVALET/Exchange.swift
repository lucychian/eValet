//
//  Exchange.swift
//  eVALET
//
//  Created by Pooja Rajkumar on 9/8/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit
import Parse

class Exchange: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*Set Current User's occupied space */
    
    func setExchangeTable(requestUser: PFUser, occupiedUser: PFUser, exchangeTime: NSDate, requestObj: PFObject) {
        let exchangeId = PFObject(className:"Exchange")
        exchangeId["occupiedSpaceId"] = occupiedUser["stationId"]
        exchangeId["requestId"] = requestUser["objectId"]
        exchangeId["exchangeTime"] = exchangeTime;
        exchangeId["requestId"] = requestObj["objectId"]
        
    }

    /* Populate Exchange Table when a request is accepted and changes Required->fulfilled to true */
    
    func acceptedRequest(exchangeTime: NSDate, requestUser: PFUser, currentUser: PFUser) {
            let exchangeId = PFObject(className: "Exchange")
            exchangeId["exchangeTime"] = exchangeTime
            let query = PFQuery(className: "Request")
      
            query.whereKey("userId", equalTo:requestUser.objectId!)
            query.getFirstObjectInBackgroundWithBlock{(obj: AnyObject?, err: NSError?) -> Void in
                if obj != nil {
                    obj?.setObject(true, forKey: "fulfilled")
                }else {
                    print("Error")
                }
            }
        }
    
   /* In case the trade is cancelled by the spot holder user, remove the exchange, and change the request for the person who got cancelled on */
    func cancelledTrade(cancelledUser: PFUser, requestUser:PFUser, requestId: Int) {
        
        // First find the request using requestId
        
        let query = PFQuery(className: "Request")
        query.whereKey("objectId", equalTo: requestId)
        query.getFirstObjectInBackgroundWithBlock{(obj: AnyObject?, err: NSError?) -> Void in
            
        // Change the fufilled attribute to true
            if obj != nil {
                obj?.setObject(true, forKey: "fulfilled")
            } else {
                print("Error: Request Not Processed")
            }
            
        }

        query.getFirstObjectInBackgroundWithBlock{(obj: AnyObject?, err: NSError?) -> Void in
           
            if err == nil && obj != nil {
                obj?.deleteInBackground()
            
            } else {
                print("Error")
            }
        }

    
    
    }
}



