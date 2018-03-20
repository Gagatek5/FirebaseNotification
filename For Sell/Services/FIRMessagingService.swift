//
//  FIRMessagingService.swift
//  For Sell
//
//  Created by Tom on 19/03/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import Foundation
import FirebaseMessaging

enum SubscriptionTopic: String{
    case newProducts = "newProducts"

}

class FIRMessagingService {
    
    private init() {}
    
    static let shared = FIRMessagingService()
    let messaging = Messaging.messaging()
    
    func subscribe(to topic: SubscriptionTopic) {
        messaging.subscribe(toTopic: topic.rawValue)
    }
    func unsubscribe(from topic: SubscriptionTopic){
        messaging.unsubscribe(fromTopic: topic.rawValue)
    }
    
}
