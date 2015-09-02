//
//  CarDocked.swift
//  eVALET
//
//  Created by Drew Taylor on 8/26/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

class CarDocked: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var viewTradeButton: UIButton!
    
    @IBAction func viewTradeButton(sender: AnyObject) {
    }
    
    
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configurePageControl()
        
        viewTradeButton.layer.cornerRadius = 5
        
        self.view.addSubview(scrollView)
        for index in 0..<2 {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            
            var subView = UIView(frame: frame)
            self.scrollView.addSubview(subView)
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 2, self.scrollView.frame.size.height)
        pageControl.addTarget(self, action: Selector("changePage:"), forControlEvents: UIControlEvents.ValueChanged)
        
        let vc0 = CarDetails(nibName: "CarDetails", bundle: nil)
        
        self.addChildViewController(vc0)
        self.scrollView.addSubview(vc0.view)
        vc0.didMoveToParentViewController(self)
        
        let vc1 = ChargingDetails(nibName: "ChargingDetails", bundle: nil)
        
        var frame1 = vc1.view.frame
        frame1.origin.x = self.view.frame.size.width
        vc1.view.frame = frame1
        
        self.addChildViewController(vc1)
        self.scrollView.addSubview(vc1.view)
        vc1.didMoveToParentViewController(self)
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, 240)
        
        
        
        
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        
        self.pageControl.numberOfPages = 2
        self.pageControl.currentPage = 0
        self.view.addSubview(pageControl)
        self.pageControl.tintColor = UIColor.redColor()
        self.pageControl.pageIndicatorTintColor = UIColor(netHex:0x666666)
        self.pageControl.currentPageIndicatorTintColor = UIColor(netHex:0x1881C6)
        
    }

    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

