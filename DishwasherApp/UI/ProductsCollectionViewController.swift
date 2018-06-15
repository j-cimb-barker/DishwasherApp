//
//  ProductsCollectionViewController.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ProductsCollectionViewController: UICollectionViewController {

    var products = [Product] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Logging.JLog(message: "viewDidLoad")
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        for _ in 0...19 {
            
            let mockProduct = MockProduct ()
            
            products.append(mockProduct)
            
        }
        
        
        self.collectionView?.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Logging.JLog(message: "self.products.count : \(self.products.count)")
        return self.products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
    
        // Configure the cell
    
        Logging.JLog(message: "cellForItemAt")
     
        
        
        //cell.backgroundColor = UIColor.yellow
        cell.testLabel.text = "bbb"
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Logging.JLog(message: "got tap")
        //self.performSegue(withIdentifier: "showDetail", sender: self)
        
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController")
        
        self.navigationController?.pushViewController(detailController!, animated: true)
        
        
    }
    
    
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
