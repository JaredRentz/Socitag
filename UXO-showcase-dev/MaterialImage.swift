//
//  MaterialImage.swift
//  UXO-showcase-dev
//
//  Created by Jared Rentz on 12/19/15.
//  Copyright © 2015 UXOThings LLC. All rights reserved.
//

import UIKit

class MaterialImage: UIImageView {
    
    override func awakeFromNib() {
        
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 1.0).CGColor
        layer.shadowOpacity = 0.70
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSizeMake(0, 2.0)
        
   }
    
}
