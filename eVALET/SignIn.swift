//
//  SignIn.swift
//  eVALET
//
//  Created by Drew Taylor on 9/2/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit
import Parse

class SignIn: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var signIn: UIButton!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    var alert = UIAlertView()
    
    @IBAction func signInPressed(sender: AnyObject) {
        loginUser(emailTextField.text!, password: passwordTextField.text!, block: {
            (user:PFUser?, error: NSError?) -> Void in
            if (error != nil) {
                self.alert.title = "Invalid Sign In"
                self.alert.message = "Please enter valid information."
                self.alert.addButtonWithTitle("Ok")
                self.alert.show()
            }
            else
            {
                self.performSegueWithIdentifier("signIn", sender: self)
            }
            //error check
            //message
        })

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signIn.layer.cornerRadius = 5

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
