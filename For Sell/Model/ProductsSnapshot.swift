//
//  ProductsSnapshot.swift
//  For Sell
//
//  Created by Tom on 19/03/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import Foundation
import Firebase

struct ProductsSnapshot {
    let products: [Product]
    
    init?(snapshot: DataSnapshot){
        guard let snapDict = snapshot.value as? [String:[String:Any]] else {return nil}
        var products = [Product]()
        for snap in snapDict {
            guard let product = Product(valueDict: snap.value) else { continue }
            products.append(product)
            
            
        }
        self.products = products
    }
    

}
