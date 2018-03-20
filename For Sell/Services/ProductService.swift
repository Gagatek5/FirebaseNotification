//
//  ProductService.swift
//  For Sell
//
//  Created by Tom on 19/03/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import Foundation

protocol ProductsServiceDelegate {
    func didChange(products: [Product])
}

class ProductService {
    private init() {}
    static let shared = ProductService()
    var delegate: ProductsServiceDelegate?
    
    func observeProduct() {
        FIRDatabaseSevice.sheard.observe(.products) { (snapshot) in
            guard let productSnapshot = ProductsSnapshot(snapshot: snapshot) else {return}
            self.delegate?.didChange(products: productSnapshot.products)
        }
    }
    func post(product: Product){
        FIRDatabaseSevice.sheard.post(parameters: product.parameters(), to: .products)
    }
}
