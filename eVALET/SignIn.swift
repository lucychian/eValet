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
                getUserInfo(PFUser.currentUser()!.objectId!, block: {
                    (user:PFObject?, error: NSError?) -> Void in
                    let user = user as! PFUser
                    let userImageFile = user["userImage"] as! PFFile
                    userImageFile.getDataInBackgroundWithBlock {
                        (imageData: NSData?, error: NSError?) -> Void in
                        if error == nil {
                            if let imageData = imageData {
                                let image = UIImage(data:imageData)
                                
                                let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
                                let destinationPath = documentsPath.NS.stringByAppendingPathComponent("evaletProfile.jpg")
                                let imageData = UIImageJPEGRepresentation(image!, 1)!
                                imageData.writeToFile(destinationPath, atomically: true)
                                
                            }
                        }
                    }
                    
                })
                
                
                self.performSegueWithIdentifier("signIn", sender: self)
            }
            //error check
            //message
        })

    }
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
