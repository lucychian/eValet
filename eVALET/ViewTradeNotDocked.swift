//
//  ViewTradeNotDocked.swift
//  eVALET
//
//  Created by Jacob Copus on 9/9/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

class ViewTradeNotDocked: UIViewController, UIScrollViewDelegate {

    //UI vars
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var tradeField: UILabel!
    
    //Setup trade time info
    var tradeTime = NSDate()
    var formatter = NSDateFormatter()
    
    //Setup frame for adding elements
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Format time for trade info
        formatter.timeStyle = .ShortStyle
        tradeField.text = "Trade at " + formatter.stringFromDate(tradeTime)
        
        //Configure page controller
        configurePageControl()
        
        //Setup for scroll view
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for index in 0..<2 {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            
            let subView = UIView(frame: frame)
            self.scrollView.addSubview(subView)
        }
        
        //More setup for scroll view
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
    
    //Setup for page controller
    func configurePageControl() {
        self.pageControl.numberOfPages = 2
        self.pageControl.currentPage = 0
        self.view.addSubview(pageControl)
        self.pageControl.pageIndicatorTintColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 24/255, green: 129/255, blue: 198/255, alpha: 1)
        
    }
    
    //Change page when page controller tapped, currently breaks when implemented
    func changePage(sender: AnyObject) -> () {
        //let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width * 1.27
        //scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
        return
    }
    
    //Change page dot when scrolling stops
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

}
