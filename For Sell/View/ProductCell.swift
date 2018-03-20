//
//  ProductCell.swift
//  For Sell
//
//  Created by Tom on 19/03/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configuration(with product: Product)
    {
        titleLabel.text = product.title
        priceLabel.text = product.price()
    }
    
}
