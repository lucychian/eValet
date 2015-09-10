//
//  CarDocked.swift
//  eVALET
//
//  Created by Drew Taylor on 8/26/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit
import Foundation
import Parse

class CarDocked: UIViewController, UIScrollViewDelegate {

    //UI components
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var viewTradeButton: UIButton!
    @IBAction func viewTradeButton(sender: AnyObject) {
    }
    
    //Frame for adding elements
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    
    //Alert pop up
    var alert = UIAlertView()
    var about = UIAlertView()
    
    //Handle press of settings button
    @IBAction func settingsButtonPressed(sender: AnyObject) {
        alert.delegate = self
        
        alert.title = "Settings"
        alert.addButtonWithTitle("About")
        alert.addButtonWithTitle("Sign Out")
        alert.addButtonWithTitle("Cancel")
        alert.show()
    }
    
    //Handle alert view button actions for settings
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex{
        case 0:
            about.title = "About"
            about.message = "eVALET app made for Cisco GIS by Lucy Chian, Jacob Copus, Pooja Rajkumar, and Drew Taylor. Thanks for using the app!"
            about.addButtonWithTitle("Close")
            about.show()
        case 1:
            PFUser.logOutInBackground()
            NSUserDefaults.standardUserDefaults().setObject(false, forKey: "loggedIn")
            self.performSegueWithIdentifier("signOut", sender: self)
        case 2:
            alert.endEditing(true)
        default:
            print("Error in alert selection.")
        }
    }

    //Set status bar style
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup for page control element
        configurePageControl()
        
        //Button styling
        viewTradeButton.layer.cornerRadius = 5
        
        //Scrollview setup
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for index in 0..<2 {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            
            let subView = UIView(frame: frame)
            self.scrollView.addSubview(subView)
        }
        
        //More scrollview setup
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 1.27, self.scrollView.frame.size.height)
        pageControl.addTarget(self, action: Selector("changePage:"), forControlEvents: UIControlEvents.ValueChanged)
        
        //Child view controller setup for car details
        let vc0 = CarDetails(nibName: "CarDetails", bundle: nil)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = documentsPath.NS.stringByAppendingPathComponent("evaletProfile.jpg")
        vc0.passedImage = UIImage(contentsOfFile: destinationPath)
        vc0.passedName = NSUserDefaults.standardUserDefaults().objectForKey("firstName")!.description + " " + NSUserDefaults.standardUserDefaults().objectForKey("lastName")!.description
        //vc0.passedCar =
        
        //Add car details view controller as child
        self.addChildViewController(vc0)
        self.scrollView.addSubview(vc0.view)
        vc0.didMoveToParentViewController(self)
        
        //Child view controller setup for charging details
        let vc1 = ChargingDetails(nibName: "ChargingDetails", bundle: nil)
        
    
        vc1.passedStation = "2"
        vc1.passedLocation = "Garage"
            
        var frame1 = vc1.view.frame
        frame1.origin.x = self.view.frame.size.width
        vc1.view.frame = frame1
            
        //Add charging details view controller as child
        self.addChildViewController(vc1)
        self.scrollView.addSubview(vc1.view)
        vc1.didMoveToParentViewController(self)
    }
    
    //Initial setup for page controller
    func configurePageControl() {
        self.pageControl.numberOfPages = 2
        self.pageControl.currentPage = 0
        self.view.addSubview(pageControl)
        self.pageControl.pageIndicatorTintColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 24/255, green: 129/255, blue: 198/255, alpha: 1)
        
    }

    //Currently unused function for changing page when tapped, breaks if implemented
    func changePage(sender: AnyObject) -> () {
        //let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width * 1.27
        //scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
        return
    }
    
    //Change page dot to current page
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

