//
//  PostCell.swift
//  UXO-showcase-dev
//
//  Created by Jared Rentz on 12/20/15.
//  Copyright © 2015 UXOThings LLC. All rights reserved.
//

import UIKit


class PostCell: UITableViewCell {
    
    @IBOutlet weak var showcaseImg: UIImageView!
    @IBOutlet weak var profileImg: UIImageView!

    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func drawRect(rect: CGRect) {
        profileImg.layer.cornerRadius = profileImg.frame.size.width/2
        profileImg.clipsToBounds = true
        
       showcaseImg.clipsToBounds = true
        
    }
    
    
    
    func configureCell (post: Post) {
     self.post = post
        
        
            self.descriptionText.text = post.postDescription
        self.likesLbl.text = "\(post.likes)"
        
        
    }
}
