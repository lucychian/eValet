//
//  SignUpPageOne.swift
//  eVALET
//
//  Created by Drew Taylor on 9/2/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class SignUpPageOne: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet var secondNameTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
