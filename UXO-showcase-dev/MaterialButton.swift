//
//  MaterialButton.swift
//  UXO-showcase-dev
//
//  Created by Jared Rentz on 12/19/15.
//  Copyright © 2015 UXOThings LLC. All rights reserved.
//

import UIKit

class MaterialButton: UIButton {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.8).CGColor
        layer.cornerRadius = 4.0
        layer.shadowOffset = CGSizeMake(0, 6.0)
        layer.shadowOpacity = 0.80
       
    }
}