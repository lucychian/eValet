//
//  CarDetails.swift
//  eVALET
//
//  Created by Drew Taylor on 8/26/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class CarDetails: UIViewController {
    
    //User info
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var nameField: UILabel!
    
    //Variables passed from parent view
    var passedImage: UIImage!
    var passedName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Profile picture styling
        profilePic.image = passedImage!
        profilePic.layer.borderColor = UIColor(red: 24/255, green: 129/255, blue: 198/255, alpha: 1).CGColor
        profilePic.layer.borderWidth = 2
        profilePic.layer.cornerRadius = 18
        profilePic.layer.masksToBounds = true
        
        //Change name to passed data
        nameField.text = passedName!
        
        //Change car to passed image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
