//
//  FIRDatabaseSevice.swift
//  For Sell
//
//  Created by Tom on 19/03/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import Foundation
import Firebase

enum FIRDatabaseReference: String {
    case products = "products"
}

class FIRDatabaseSevice {
    
    private init() {}
    static let sheard = FIRDatabaseSevice()
    
    func referance(_ databaseReferance: FIRDatabaseReference) -> DatabaseReference {
        
        return Database.database().reference().child(databaseReferance.rawValue)
    }

    func observe(_ databaseReferance: FIRDatabaseReference, complition: @escaping (DataSnapshot)-> Void) {
        
        referance(databaseReferance).observe(.value) { (snapshot) in
            complition(snapshot)
        }
    }
    func post(parameters: [String: Any], to databaseReferance: FIRDatabaseReference) {
        referance(databaseReferance).childByAutoId().setValue(parameters)
    }
}



