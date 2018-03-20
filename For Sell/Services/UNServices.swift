//
//  UNServices.swift
//  For Sell
//
//  Created by Tom on 19/03/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit
import UserNotifications

class UNServices: NSObject {
    
    private override init() {}
    static let shared = UNServices()
    let uncenter = UNUserNotificationCenter.current()
    
    func autorize() {
        let option: UNAuthorizationOptions = [.alert, .badge, .sound]
        uncenter.requestAuthorization(options: option) { (granted, error ) in
            print(error ?? "no un authrization error")
            guard granted else {return}
            DispatchQueue.main.async {
                self.configure()
            }
        }
    }
    
    func configure(){
        
        uncenter.delegate = self
        
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
        
    }
}

extension UNServices: UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("un did receive")
        
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("un will present")
        
        let option: UNNotificationPresentationOptions = [.alert, .sound]
        
        completionHandler(option)
    }
    
}
