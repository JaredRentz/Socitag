//
//  DataService.swift
//  UXO-showcase-dev
//
//  Created by Jared Rentz on 12/20/15.
//  Copyright © 2015 UXOThings LLC. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "https://jared-showcase.firebaseio.com/")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
}