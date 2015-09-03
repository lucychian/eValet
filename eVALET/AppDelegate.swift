//
//  AppDelegate.swift
//  eVALET
//
//  Created by Drew Taylor on 8/26/15.
//  Copyright © 2015 Drew Taylor. All rights reserved.
//

import UIKit

import Parse
import Bolts


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("S34Ygv6AIhddz9xbroATZlHzCZymymuSJ35b3tu0",
            clientKey: "ct7jPD2vsLsx2xLI1wGaFaByh6J6V6mgotQCK3e3")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
       
        // Save an example object to the cloud
        let username = PFObject(className:"userName")
        username["firstName"] = "John"
        username["lastName"] = "Manville"
        username["carType"] = "Ford"
        username.objectId = "A1"
        username.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("The object has been successfully saved")
            } else {
                print("Error: Not Saved")
                
            }
        }
        // Retrieve the object 
       /* let query  = PFQuery(className: "userName")
        query.getObjectInBackgroundWithId("A1") {
            (gameScore: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                print("Found Querry")
            } else {
                print(error)
            }
        }*/
        
        
        // Checking In
        
        // Get the first person who checked in 
        // use date committed for the start time 
        // dont have to request anything for the name 
        
        
        
        
        
        return true

        
    }
    
        
    
    
    
    
    var window: UIWindow?

     

//    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

