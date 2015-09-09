//
//  SpotDetails.swift
//  eVALET
//
//  Created by Drew Taylor on 9/1/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class SpotDetails: UIViewController {

    //UI vars
    @IBOutlet var confirmSpot: UIButton!
    @IBOutlet var spotNumber: UITextField!
    @IBOutlet var currentPercent: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button styling
        confirmSpot.layer.cornerRadius = 5
        
        //Default text for inputs
        spotNumber.text = "#"
        currentPercent.text = "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Allow user to tap out of keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    //Limit inputs
    @IBAction func editingChanged(sender: AnyObject) {
        if (spotNumber.text!.characters.count > 3) {
            spotNumber.deleteBackward()
        } else if (spotNumber.text!.characters.count < 1) {
            spotNumber.text = "#"
        } else if (currentPercent.text!.characters.count > 3) {
            currentPercent.deleteBackward()
        } else if (currentPercent.text!.characters.count < 1) {
            currentPercent.text = "%"
        }
    }
}
