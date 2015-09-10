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

    //Button
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
                NSUserDefaults.standardUserDefaults().setObject(true, forKey: "loggedIn")
                NSUserDefaults.standardUserDefaults().setObject(self.emailTextField.text, forKey: "email")
                
                let usr = PFUser.currentUser()!
                
                NSUserDefaults.standardUserDefaults().setObject(usr["firstName"]!, forKey: "firstName")
                NSUserDefaults.standardUserDefaults().setObject(usr["lastName"]!, forKey: "lastName")
                
                let userImageFile = usr["userImage"] as! PFFile
                userImageFile.getDataInBackgroundWithBlock ({
                    (imageData: NSData?, error: NSError?) -> Void in
                    if error == nil {
                        if let imageData = imageData {
                            let image = UIImage(data:imageData)
                            
                            let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
                            let destinationPath = documentsPath.NS.stringByAppendingPathComponent("evaletProfile.jpg")
                            let imageData = UIImageJPEGRepresentation(image!, 1)!
                                imageData.writeToFile(destinationPath, atomically: true)
                            self.performSegueWithIdentifier("signIn", sender: self)

                        }
                    }
                })
                
                
            }
            //error check
            //message
        })

    }
    
    //Allow user to tap out of keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Input field setup
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        //Button styling
        signIn.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Handle "next" buttons while inputting into text fields
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField === emailTextField) {
            if isValidEmail(textField.text!) {
                passwordTextField.becomeFirstResponder()
            } else {
                alert.title = "Invalid Email"
                alert.message = "Please enter a valid email address."
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
        } else if (textField === passwordTextField) {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
    
    //Check if email address is valid
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
}
