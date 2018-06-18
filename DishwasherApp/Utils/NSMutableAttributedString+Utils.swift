//
//  NSMutableAttributedString+Utils.swift
//  DishwasherAppTmp
//
//  Created by Josh Barker on 17/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    @discardableResult func heading(_ text: String) -> NSMutableAttributedString {
        
        let boldFont = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
        
        let attrs: [NSAttributedStringKey: Any] = [.font: boldFont]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        
        let boldFont = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        
        let attrs: [NSAttributedStringKey: Any] = [.font: boldFont]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        
        let fontUse = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        
        let attrs: [NSAttributedStringKey: Any] = [.font: fontUse]
        let theStr = NSMutableAttributedString(string:text, attributes: attrs)
        append(theStr)
        
        return self
    }
    
    @discardableResult func largePrice(_ text: String) -> NSMutableAttributedString {
        
        let boldFont = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        
        let attrs: [NSAttributedStringKey: Any] = [.font: boldFont]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func specialOffer (_ text: String) -> NSMutableAttributedString {
        
        let fontUse = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
        
        let attrs: [NSAttributedStringKey: Any]  = [.font: fontUse, .foregroundColor: UIColor.red]
        let theStr = NSMutableAttributedString(string:text, attributes: attrs)
        append(theStr)
        
        return self
    }
    
    @discardableResult func guaranteeInfo (_ text: String) -> NSMutableAttributedString {
        
        let fontUse = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
        
        let attrs: [NSAttributedStringKey: Any] = [.font: fontUse, .foregroundColor: UIColor.green]
        let theStr = NSMutableAttributedString(string:text, attributes: attrs)
        append(theStr)
        
        return self
    }
    
}
