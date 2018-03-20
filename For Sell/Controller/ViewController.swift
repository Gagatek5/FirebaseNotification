//
//  ViewController.swift
//  For Sell
//
//  Created by Tom on 19/03/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductService.shared.delegate = self
        ProductService.shared.observeProduct()
            
    }

    @IBAction func onAddTapped() {
        AlertServices.addProductAlert(in: self) { (product) in
            ProductService.shared.post(product: product)
        }
    }
    @IBAction func onSubscribeTapped(){
        AlertServices.subscribeAlert(in: self)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

}


extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else {return UICollectionViewCell()}
        let product = products[indexPath.item]
        cell.configuration(with: product)
        return cell
        
    }
    
}
extension ViewController: ProductsServiceDelegate {

    func didChange(products: [Product]) {
        self.products = products
        collectionView.reloadData()
    }
    
}



