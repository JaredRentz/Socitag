//
//  MaterialTextField.swift
//  UXO-showcase-dev
//
//  Created by Jared Rentz on 12/19/15.
//  Copyright © 2015 UXOThings LLC. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: 189.00, green: 189.00, blue: 189.00, alpha: 1.0).CGColor
        layer.shadowOffset = CGSizeMake(0, 2.0)
        layer.shadowOpacity = 0.6
        layer.borderWidth = 1.0
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 15, 0)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 15, 0)
    }

}
