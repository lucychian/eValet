//
//  SpotDetails.swift
//  eVALET
//
//  Created by Drew Taylor on 9/1/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit
import Foundation
import Parse

class SpotDetails: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //UI vars
    @IBOutlet var confirmSpot: UIButton!
    @IBOutlet var currentPercent: UITextField!
    @IBOutlet var spotPicker: UIPickerView!
    
    var alert = UIAlertView()
    
    //Button press
    @IBAction func confirmSpotPressed(sender: AnyObject) {
        if (currentPercent.text!.characters.count == 1) {
            alert.title = "Invalid Charge"
            alert.message = "Please enter a valid charge percentage."
            alert.addButtonWithTitle("Ok")
            alert.show()
        } else {
            let charge = Int(currentPercent.text!.substringWithRange(Range<String.Index>(start: currentPercent.text!.startIndex.advancedBy(1), end: currentPercent.text!.endIndex)))
            print(charge!)
            
            self.performSegueWithIdentifier("carCheckedIn", sender: self)
        }
    }
    
    var pickerDataSource: NSMutableArray = []// = ["SJC-12-1", "SJC-12-2", "SJC-12-3", "SJC-12-4", "SJC-12-5", "SJC-12-6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button styling
        confirmSpot.layer.cornerRadius = 5
        
        //Default text for inputs
        currentPercent.text = "%"
        
        //Picker view styling
        spotPicker.backgroundColor = UIColor.whiteColor()
        
        //Picker view setup
        self.spotPicker.dataSource = self;
        self.spotPicker.delegate = self;
        
        PFUser.logInWithUsernameInBackground("myUsername", password: "myPassword") {
            (result: PFUser?, error: NSError?) -> Void in
            if(error != nil) {
                print(error?.userInfo)
            }
            
            getStationList({
                (stations:[AnyObject]?, error: NSError?) -> Void in
                if (error == nil)
                {
                    for station in stations! as [AnyObject]
                    {
                        self.pickerDataSource.addObject(station["stationName"] as! String)
                    }
                    self.spotPicker.reloadAllComponents()
                }
                else
                {
                    print("Error")
                }
            })
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Allow user to tap out of keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
        return pickerDataSource[row] as? String
    }

    //Limit inputs
    @IBAction func editingChanged(sender: AnyObject) {
        if (currentPercent.text!.characters.count > 3) {
            currentPercent.deleteBackward()
        } else if (currentPercent.text!.characters.count < 1) {
            currentPercent.text = "%"
        }
    }
}
