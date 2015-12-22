//
//  Post.swift
//  UXO-showcase-dev
//
//  Created by Jared Rentz on 12/20/15.
//  Copyright © 2015 UXOThings LLC. All rights reserved.
//

import Foundation

class Post {
    private var _imageUrl:  String?
    private var _username: String!
    private var _likes: Int!
    private var _postDescription: String!
    private var _postKey: String!
    
    var imageUrl: String? {
        return _imageUrl
    }
    var username: String {
        return _username
    }
    var likes: Int {
        return _likes
    }
    var postDescription: String {
        return _postDescription
    }
    var postKey: String {
        return _postKey
    }
    
    init(username: String, description: String, imageUrl: String?){
        self._username = username
        self._postDescription = description
        self._imageUrl = imageUrl
        
    }
    
    // Used to initialize data coming form Firebase
    
    init(postKey: String, dictionary: Dictionary <String, AnyObject>) {
        self._postKey = postKey
        
        if let likes = dictionary["likes"] as? Int {
            self._likes = likes
        }
        
        if let imageUrl = dictionary["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let desc = dictionary["description"] as? String {
            self._postDescription = desc
        }
    }
}