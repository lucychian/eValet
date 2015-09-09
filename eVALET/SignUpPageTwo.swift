//
//  SignUpPageTwo.swift
//  eVALET
//
//  Created by Drew Taylor on 9/2/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class SignUpPageTwo: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var profilePic: UIImageView!
    
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var pickerView: UIPickerView!
    
    var pickerDataSource = ["BMW", "Merc", "Audi", "Honda", "Nissan", "Hyundai", "Chevy", "Ford", "Tesla", "Ferrari", "Porsche"];
    
    let alert = UIAlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePic.layer.borderColor = UIColor(red: 24/255, green: 129/255, blue: 198/255, alpha: 1).CGColor
        profilePic.layer.borderWidth = 3
        profilePic.layer.cornerRadius = 50
        profilePic.layer.masksToBounds = true
        
        pickerView.backgroundColor = UIColor.whiteColor()
        
        signUpButton.layer.cornerRadius = 5
        
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        profilePic.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("profilePicTapped")))
        profilePic.userInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var selectPhotoButton: UIButton!
    
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
    
    func selectPhotoButtonTapped() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        UIApplication.sharedApplication().statusBarStyle = .Default
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    
    func profilePicTapped() {
        alert.delegate = self
        
        alert.title = "Choose a Profile Picture"
        alert.message = "Please take or choose a profile picture."
        alert.addButtonWithTitle("Take Picture")
        alert.addButtonWithTitle("Choose Picture")
        alert.addButtonWithTitle("Cancel")
        alert.show()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
        
    {
        profilePic.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
    }
    
    func takePhotoButtonTapped() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        NSUserDefaults.standardUserDefaults().setObject(pickerDataSource[pickerView.selectedRowInComponent(0)], forKey: "userCar")
            
        return true
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
