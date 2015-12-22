//
//  DataService.swift
//  UXO-showcase-dev
//
//  Created by Jared Rentz on 12/20/15.
//  Copyright © 2015 UXOThings LLC. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE: String = "https://jared-showcase.firebaseio.com"

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    private var _REF_POST = Firebase(url: "\(URL_BASE)/posts")
    private var _REF_USERS = Firebase(url: "\(URL_BASE)/users")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_POST: Firebase {
        return _REF_POST
    }
    
    var REF_USERS: Firebase {
        return _REF_USERS
    }
  // Firebase Appends the data for a username 
    
    func createFirebaseUser(uid: String, user: Dictionary <String, String>) {
        REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}