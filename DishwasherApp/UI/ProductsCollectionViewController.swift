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
    
    var sectionInsets = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Logging.JLog(message: "viewDidLoad")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        /*
        // UI development
        for _ in 0...19 {
            let mockProduct = MockProduct ()
            products.append(mockProduct)
        }
        self.collectionView?.reloadData()
         */
        
        DishwasherDataApi.shared.getAllProducts { (productsGot :[Product], errorStr: String) in
            
            Logging.JLog(message: "errorStr : \(errorStr)")
            Logging.JLog(message: "productsGot : \(productsGot.count)")
            
            self.products = productsGot
            
            DispatchQueue.main.async { [unowned self] in
                self.collectionView?.reloadData()
            }
            
        }
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
     
        let product = self.products [indexPath.row]
        Logging.JLog(message: "product.title : \(product.title)")
        
        cell.setDescription(descr: product.title, priceStr: product.price)
        cell.setImg(imgURL: product.imageURL!)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        detailController.product = self.products [indexPath.row]
        
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}

extension ProductsCollectionViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // should not be hard-coded...
        return CGSize(width: 200, height: 250)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        // should not be hard-coded...
        return 120
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    
}
