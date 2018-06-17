//
//  ProductDetailViewController.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productImgVIew: UIImageView!
   
    
    @IBOutlet weak var productDescrTextView: UITextView!
   
    
    @IBOutlet weak var productDetailsTextView: UITextView!
    
    @IBOutlet weak var productDetailsTableView: UITableView!
    
    let headings = [
        "Heading1",
        "Heading2"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}

extension ProductDetailViewController : UITableViewDelegate {
    
}

extension ProductDetailViewController : UITableViewDataSource {
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.headings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = productDetailsTableView.dequeueReusableCell(withIdentifier: "profileCell")!
        
        return cell
    }
    
    
}

