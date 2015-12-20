//
//  ViewController.swift
//  UXO-showcase-dev
//
//  Created by Jared Rentz on 12/19/15.
//  Copyright © 2015 UXOThings LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signInbtn: UIButton!
 
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signinButtonPressed(sender: UIButton) {
        
    signInbtn.setTitle("Processing...", forState: UIControlState.Normal)
      self.signInbtn.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableButton", userInfo: nil, repeats: false)
        
        enableButton()
    }
  
    func enableButton() {
     self.signInbtn.enabled = true
       
        
    }

}