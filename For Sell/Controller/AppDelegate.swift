//
//  AppDelegate.swift
//  For Sell
//
//  Created by Tom on 19/03/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit
import Firebase
import Messages

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UNServices.shared.autorize()
        FirebaseApp.configure()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("did register for notification")
        //print(Messaging.messaging().fcmToken) do zdobywania id telefonu
        
    }


}

