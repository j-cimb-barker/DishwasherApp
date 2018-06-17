//
//  ProductDetailViewController.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    
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
        self.setupProductImages()
    }

    func setupProductImages () {

        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        
        self.scrollView.delegate = self
        
        self.scrollView.contentSize = CGSize(width:scrollViewWidth * 3, height:self.scrollView.frame.height)
        
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

