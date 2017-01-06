//
//  AppDelegate.swift
//  Colmeia
//
//  Created by André Marques da Silva Rodrigues on 04/01/17.
//  Copyright © 2017 Vergil. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = "SU0myMIe1AUitLKar0mum8My8RbQ87lEaRjjKDgh"
            $0.clientKey = "Fttez4PLMZOJbNty4lfT8QYcSj28worpNdoYxicO"
            $0.server = "https://parseapi.back4app.com/"
        }
        
        Parse.initialize(with: configuration)
                
        return true
    }

}

