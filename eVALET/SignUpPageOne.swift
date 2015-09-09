//
//  SignUpPageOne.swift
//  eVALET
//
//  Created by Drew Taylor on 9/2/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class SignUpPageOne: UIViewController, UITextFieldDelegate {
    
    //Text inputs
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var secondNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    //Buttons
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    
    //Alert popup
    let alert = UIAlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Input field setup
        self.firstNameTextField.delegate = self
        self.secondNameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        //Button styling
        continueButton.backgroundColor = UIColor.grayColor()
        continueButton.layer.cornerRadius = 5
        signInButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Allow user to tap out of keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Handle "next" buttons while inputting into text fields
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField === firstNameTextField) {
            secondNameTextField.becomeFirstResponder()
        } else if (textField === secondNameTextField) {
            emailTextField.becomeFirstResponder()
        } else if (textField === emailTextField) {
            if isValidEmail(textField.text!) {
                passwordTextField.becomeFirstResponder()
            } else {
                alert.title = "Invalid Email"
                alert.message = "Please enter a valid email address."
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
        } else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    //Change button styling based on whether or not information has been entered
    @IBAction func editingChanged(sender: AnyObject) {
        if (!firstNameTextField.text!.isEmpty || !secondNameTextField.text!.isEmpty || !emailTextField.text!.isEmpty ||
            !passwordTextField.text!.isEmpty) {
            signInButton.enabled = false
            signInButton.backgroundColor = UIColor.grayColor()
        } else {
            signInButton.enabled = true
            signInButton.backgroundColor = UIColor(red: 24/255, green: 129/255, blue: 198/255, alpha: 1)
        }
        
        if (firstNameTextField.text!.isEmpty || secondNameTextField.text!.isEmpty || emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty) {
            continueButton.enabled = false
            continueButton.backgroundColor = UIColor.grayColor()
        } else {
            continueButton.enabled = true
            continueButton.backgroundColor = UIColor(red: 113/255, green: 171/255, blue: 54/255, alpha: 1)
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        //Pressed continue button
        if (identifier == "signUp2") {
            //Popup if email is invalid, continue if email is valid
            if isValidEmail(emailTextField.text!) {
                NSUserDefaults.standardUserDefaults().setObject(firstNameTextField.text, forKey: "firstName")
                NSUserDefaults.standardUserDefaults().setObject(secondNameTextField.text, forKey: "lastName")
                NSUserDefaults.standardUserDefaults().setObject(emailTextField.text, forKey: "email")
                return true
            } else {
                alert.title = "Invalid Email"
                alert.message = "Please enter a valid email address."
                alert.addButtonWithTitle("Ok")
                alert.show()
                return false
            }
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
