//
//  LoginCheck.swift
//  eVALET
//
//  Created by Jacob Copus on 9/8/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit


class LoginCheck: UIViewController {
    var loggedIn = false
    var carDocked = false
    
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        //self.view.hidden = true
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("loggedIn") != nil) {
            loggedIn = NSUserDefaults.standardUserDefaults().boolForKey("loggedIn")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        //Control which page is visited based on user status
        if (loggedIn) {
            if (carDocked) {
                self.performSegueWithIdentifier("carDocked", sender: self)
            } else {
                self.performSegueWithIdentifier("noCarDocked", sender: self)
            }
        } else {
            self.performSegueWithIdentifier("signUp", sender: self)
        }
    }
}
