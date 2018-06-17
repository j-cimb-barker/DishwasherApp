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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setupProductImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    func setupProductDetails () {
        
        let fullDescrStr = NSMutableAttributedString()
        
        fullDescrStr.largePrice("£" + product.priceDict ["now"]!)
        
        if product.displaySpecialOffer != "" {
            fullDescrStr.specialOffer ("\n" + product.displaySpecialOffer)
        }
        
        fullDescrStr.guaranteeInfo("\n" + product.guranteeStr)
        
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
                // Perform operation.
                
                /*
                Logging.JLog(message: "got img with size : \(image?.size)")
                
                var resizedImg = self.resizeImage(image: image!, newWidth: imgView.frame.size.width)
                imgView.image = resizedImg*/
                
            })
            
            //imgView.sd_setImage(with: URL(string: self.product.images[counter]), placeholderImage: UIImage(named: "placeholder.png"))
            //imgView.frame = imgViewFrame
            
            
            self.scrollView.addSubview(imgView)
            
        }
        
        
        self.productImg2.frame = CGRect (x: scrollViewWidth, y: 0, width: scrollViewWidth, height: scrollViewHeight)
        
        self.productImg3.frame = CGRect (x: scrollViewWidth * 2, y: 0, width: scrollViewWidth, height: scrollViewHeight)
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
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
        return "Product Information"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.headings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell:UITableViewCell = productDetailsTableView.dequeueReusableCell(withIdentifier: "profileCell")!
        
        let cell:UITableViewCell = UITableViewCell.init(style: .value1, reuseIdentifier: "profileCell")
        
        
        cell.textLabel?.text = "Hello"
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "Detail"
        
        return cell
    }
    
    
}

