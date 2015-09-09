//
//  LoginCheck.swift
//  eVALET
//
//  Created by Jacob Copus on 9/8/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class LoginCheck: UIViewController {
    var loggedIn = true
    var carDocked = true
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.view.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
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
