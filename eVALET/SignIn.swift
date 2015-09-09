//
//  SignIn.swift
//  eVALET
//
//  Created by Drew Taylor on 9/2/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class SignIn: UIViewController {

    //Button
    @IBOutlet var signIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button styling
        signIn.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
