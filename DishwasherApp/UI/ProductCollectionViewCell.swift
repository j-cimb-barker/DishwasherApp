//
//  ProductCollectionViewCell.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var testLabel: UILabel!
    
    var size = CGSize (width: 0, height: 0)
    
    @IBOutlet var theView: UICollectionViewCell!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Logging.JLog(message: "initWithFrame : \(frame)")
        
        //self.frame = frame
        self.size = frame.size
        
        commonInit ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit ()
    }
    
    private func commonInit () {
        
        //theView.frame.size = self.size
        
        Bundle.main.loadNibNamed("ProductCollectionViewCell", owner:self, options: nil)
        self.addSubview(theView)
    }
}
