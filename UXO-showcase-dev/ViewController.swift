//
//  ViewController.swift
//  UXO-showcase-dev
//
//  Created by Jared Rentz on 12/19/15.
//  Copyright © 2015 UXOThings LLC. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var signInbtn: UIButton!
    @IBOutlet weak var emailField: MaterialTextField!
    @IBOutlet weak var passwordField: MaterialTextField!
 
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
        }
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
    
    @IBAction func fbBtnPressed(sender: UIButton) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError:NSError!) -> Void in
            
            if facebookError != nil {
                print ("Login failed.\(facebookError)")
            } else {
                 let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Succesgully logged in with facebook. \(accessToken)")
                
                DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: {error, authData in
                    
                    if error != nil {
                        print("login Failed. \(error)")
                    } else {
                    print ("Logged In! \(authData)")
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                        
                        let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                        
                        DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
                        })
                    }
                })
    
                }
    }
    }
    
    @IBAction func attemptSignIn(sender: UIButton) {
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            
            DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: {error, authData in
                
                if error != nil {
                    print(error)
                    
                    if error.code == STATUS_ACCOUNT_NONEXIST {
                        DataService.ds.REF_BASE.createUser(email, password: pwd, withValueCompletionBlock: { error, result in
                            
                            if error != nil {
                                self.showErrorAlert("Uh Oh", msg: "Problem with Account. Try something else")
                            } else {
                                NSUserDefaults.standardUserDefaults().setValue(result[KEY_UID], forKey: KEY_UID)
                                
                                DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { err, authData in
                                    
                                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                                    
                                })
                            }
                        })
                    } else {
                        if error.code == WRONG_PASSWORD{
                        self.showErrorAlert("That password!", msg: "Come on you know thats not it!")
                        } else {
                            if error.code == WRONG_USERNAME {
                                self.showErrorAlert("That Username... Really!", msg: "Get it together and try again")
                            }
                            
                        }
                    }
                    
                } else {
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                }
                
            })
            
        } else {
            showErrorAlert("Email and Password Required", msg: "Please enter an Email and Password")
        }
    }
    func showErrorAlert (title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
}