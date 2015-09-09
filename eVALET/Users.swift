//
//  Users.swift
//  eVALET
//
//  Created by Lucy Chian on 9/1/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import Foundation
import Parse


/*
createUser
Parameters:
username - set by new user when signing up
password - new user created password
email - new user's email
Return:
Bool - true if user is successfully created, false otherwise
*/

func createUser(username: String, password: String, email: String, block: PFBooleanResultBlock) -> Void {
    
    let user = PFUser()
    user.username = username
    user.password = password
    user.email = email
    
    user.signUpInBackgroundWithBlock(block)
}


/*
loginUser
Parameters:
username - user signing in
password - user's password
Return:
Bool - true if sign in successful, false otherwise
*/

func loginUser(username: String, password: String) -> Bool{
    
    var result = false
    PFUser.logInWithUsernameInBackground(username, password:password) {
        (user: PFUser?, error: NSError?) -> Void in
        if user != nil {
            result = true
        }
    }
    return result
}

/*
getUserInfo
Parameters:
userId - user ID of person to return information for
block - results block
*/
func getUserInfo(userId: String, block: PFObjectResultBlock) {
    
    let query = PFQuery()
    query.getObjectInBackgroundWithId(userId, block: block)
    
}