//
//  SignUpPageTwo.swift
//  eVALET
//
//  Created by Drew Taylor on 9/2/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class SignUpPageTwo: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var profilePic: UIImageView!
    
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var pickerView: UIPickerView!
    
    var pickerDataSource = ["BMW", "Merc", "Audi", "Honda", "Nissan", "Hyundai", "Chevy", "Ford", "Tesla", "Ferrari", "Porsche"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePic.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1).CGColor
        profilePic.layer.borderWidth = 3
        profilePic.layer.cornerRadius = 50
        profilePic.layer.masksToBounds = true
        
        pickerView.backgroundColor = UIColor.whiteColor()
        
        signUpButton.layer.cornerRadius = 5
        
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSource[row]
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
