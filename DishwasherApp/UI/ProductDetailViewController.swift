//
//  ProductDetailViewController.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class ProductDetailViewController: UIViewController {

    var product = Product ()
    
    var productImgViews = [UIImageView] ()
    
    @IBOutlet weak var productImgView: UIImageView!
    
    @IBOutlet weak var productDetailsTextView: UITextView!
    
    @IBOutlet weak var productInfoTextView: UITextView!
    
    @IBOutlet weak var productSpecTableView: UITableView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var productImg1: UIImageView!
    @IBOutlet weak var productImg2: UIImageView!
    @IBOutlet weak var productImg3: UIImageView!
    
    @IBOutlet weak var imgPageCtrl: UIPageControl!
    
    
    let headings = [
        "Heading1",
        "Heading2"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productSpecTableView.delegate = self
        productSpecTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        self.setupProductDetails()
        self.setupProductInfo()
        
        self.navigationItem.title = self.product.title
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setupProductImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    func setupProductInfo () {
        
        let convertedStr = product.productInfo.html2String
        
        let start = convertedStr.index(convertedStr.startIndex, offsetBy: 0)
        let end = convertedStr.index(convertedStr.startIndex, offsetBy: 300)
        let range = start..<end
        let prodInfoStr = convertedStr[range]  // play
        
        let fullDescrStr = NSMutableAttributedString()
        
        fullDescrStr.heading("Product Information")
        fullDescrStr.normal("\nProduct code: \(self.product.code)")
        fullDescrStr.normal("\n" + String(prodInfoStr) + "...")
        
        self.productInfoTextView.attributedText = fullDescrStr
        
    }
    
    func setupProductDetails () {
        
        let fullDescrStr = NSMutableAttributedString()
        
        fullDescrStr.largePrice("£" + product.price)
        
        if product.displaySpecialOffer != "" {
            fullDescrStr.specialOffer ("\n" + product.displaySpecialOffer)
        }
        
        fullDescrStr.guaranteeInfo("\n" + product.guaranteeStr)
        
        self.productDetailsTextView.attributedText = fullDescrStr
        
        
    }
    
    func setupProductImages () {

        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        
        self.scrollView.delegate = self
        
        self.imgPageCtrl.numberOfPages = self.product.images.count
        
        //let prodImages = self.product.media ["images"] as! [String:Any]
        
        Logging.JLog(message: "scrollViewWidth : \(scrollViewWidth)")
        
        self.scrollView.contentSize = CGSize(width:scrollViewWidth * CGFloat (self.imgPageCtrl.numberOfPages), height:self.scrollView.frame.height)
        
        for counter in 0...(self.product.images.count - 1) {
            
            let imgViewFrame = CGRect (x: scrollViewWidth * CGFloat(counter), y: 0, width: scrollViewWidth, height: scrollViewHeight)
            
            let imgView = UIImageView.init(frame: imgViewFrame)
            imgView.contentMode = .scaleAspectFit
            
            imgView.sd_setImage(with: URL(string: self.product.images[counter]), completed: { (image, error, cacheType, imageURL) in
            })
            
            self.scrollView.addSubview(imgView)
            
        }
        
        
        self.productImg2.frame = CGRect (x: scrollViewWidth, y: 0, width: scrollViewWidth, height: scrollViewHeight)
        
        self.productImg3.frame = CGRect (x: scrollViewWidth * 2, y: 0, width: scrollViewWidth, height: scrollViewHeight)
    }
    
    
    
    
    
    @IBAction func imgPageCtrlChanged(_ sender: UIPageControl) {
        Logging.JLog(message: "sender.currentPage : \(sender.currentPage)")
        
        
        let slideToX = self.scrollView.frame.size.width * CGFloat (sender.currentPage)
        let pageWidth = self.scrollView.frame.size.width
        
        self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidLayoutSubviews() {
        Logging.JLog(message: "viewDidLayoutSubviews")
    }
    
    override public var traitCollection: UITraitCollection {
        
        if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isLandscape {
            
            Logging.JLog(message: "landscape")
            
            return UITraitCollection (traitsFrom: [UITraitCollection(horizontalSizeClass: .compact), UITraitCollection(verticalSizeClass: .regular)])
            
        }
        
        
        
        Logging.JLog(message: "ddddd")
        return super.traitCollection
    }
    
    

}

extension ProductDetailViewController : UITableViewDelegate {
    
}

extension ProductDetailViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Product Specification"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.product.features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell.init(style: .value1, reuseIdentifier: "profileCell")
        
        let feature = self.product.features [indexPath.row]
        
        cell.textLabel?.text = feature.name
        //cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = feature.value
        
        return cell
    }
    
    
}

