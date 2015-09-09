//
//  SignUpPageTwo.swift
//  eVALET
//
//  Created by Drew Taylor on 9/2/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit
import Foundation

public extension String {
    var NS: NSString { return (self as NSString) }
}

class SignUpPageTwo: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //UI Vars
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var pickerView: UIPickerView!
    
    //Array for data picker
    var pickerDataSource = ["BMW", "Merc", "Audi", "Honda", "Nissan", "Hyundai", "Chevy", "Ford", "Tesla", "Ferrari", "Porsche"];
    
    //Pop up alert
    let alert = UIAlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Profile picture styling
        profilePic.layer.borderColor = UIColor(red: 24/255, green: 129/255, blue: 198/255, alpha: 1).CGColor
        profilePic.layer.borderWidth = 3
        profilePic.layer.cornerRadius = 50
        profilePic.layer.masksToBounds = true
        
        //Picker view styling
        pickerView.backgroundColor = UIColor.whiteColor()
        
        //Button styling
        signUpButton.layer.cornerRadius = 5
        
        //Picker view setup
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        //Profile picture gesture handling
        profilePic.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("profilePicTapped")))
        profilePic.userInteractionEnabled = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        //Change navigation bar after returning from choose picture
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Handle alert view button actions for image picking
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex{
        case 0:
            takePhotoButtonTapped()
        case 1:
            selectPhotoButtonTapped()
        case 2:
            alert.endEditing(true)
        default:
            print("Error in alert selection.")
        }
    }
    
    //Open photo selector
    func selectPhotoButtonTapped() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        UIApplication.sharedApplication().statusBarStyle = .Default
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    
    //Pop up for selecting or taking photos
    func profilePicTapped() {
        alert.delegate = self
        
        alert.title = "Choose a Profile Picture"
        alert.message = "Please take or choose a profile picture."
        alert.addButtonWithTitle("Take Picture")
        alert.addButtonWithTitle("Choose Picture")
        alert.addButtonWithTitle("Cancel")
        alert.show()
    }
    
    //Apply selected photo
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
        
    {
        profilePic.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
    }
    
    //Open camera to take photo
    func takePhotoButtonTapped() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    
    //Function for number of components in picker view
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Picker view setup function
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    //Picker view setup function
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        //Store user inputs before continuing
        NSUserDefaults.standardUserDefaults().setObject(pickerDataSource[pickerView.selectedRowInComponent(0)], forKey: "userCar")
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = documentsPath.NS.stringByAppendingPathComponent("evaletProfile.jpg")
        UIImageJPEGRepresentation(profilePic.image!, 1)!.writeToFile(destinationPath, atomically: true)
        
        return true
    }
}
