//
//  AppDelegate.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // This property is in all AppDelegate files by default
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        ////////////////////// Presenting UI without the use of a main.storyboard
        //
        // Create a new window for the window property that
        // comes standard on the AppDelegate class. The UIWindow
        // is where all view controllers and views appear.
        window = UIWindow(frame: UIScreen.main.bounds)
        //
        // Create a new instance of WeatherViewController
        let mainViewController = WeatherViewController()
        //
        // Set the initial View Controller to our instance of WeatherViewController
        window?.rootViewController = mainViewController
        //
        // Present the window
        window?.makeKeyAndVisible()
        //
        //////////////////////
        
        return true
    }
    
    
}

