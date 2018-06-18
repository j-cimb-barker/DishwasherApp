//
//  ProductCollectionViewCell.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImgView: UIImageView!
    
    @IBOutlet weak var productTextView: UITextView!
    
    var size = CGSize (width: 0, height: 0)
    
    @IBOutlet var theView: UICollectionViewCell!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.size = frame.size
        
        commonInit ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit ()
    }
    
    private func commonInit () {
        
        Bundle.main.loadNibNamed("ProductCollectionViewCell", owner:self, options: nil)
        theView.frame.size = self.size
        self.addSubview(theView)
    }
    
    func setImg (imgURL: URL) {
        self.productImgView.sd_setImage(with: imgURL, completed: { (image, error, cacheType, imageURL) in
        })
    }
    
    // sets the description of the item
    func setDescription (descr: String, priceStr: String) {
        
        let fullDescrStr = NSMutableAttributedString()
        
        fullDescrStr.normal (descr)
        fullDescrStr.bold("\n£" + priceStr)
        
        self.productTextView.attributedText = fullDescrStr
        
    }
    
}
