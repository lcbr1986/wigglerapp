//
//  LoginViewController.swift
//  wiggler
//
//  Created by Luis Carlos Rosa on 11/01/16.
//  Copyright © 2016 Wiggler. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let fbButton:FBSDKLoginButton = FBSDKLoginButton(frame: CGRectMake(0,0,240,45))
//        fbButton.center = self.view.center
//        self.view.addSubview(fbButton)
    }

    @IBAction func facebookLoginPressed(sender: AnyObject) {
        checkLogin()
    }
    
    func checkLogin() {
        loginWithFB()
    }
    
    func loginWithFB(){
        let login = FBSDKLoginManager()
        
        login.logInWithReadPermissions(["public_profile"], fromViewController: self) { (result, error) -> Void in
            if error != nil {
                print("Error: \(error.localizedDescription)")
            } else {
                if result.isCancelled {
                    print("Canceled")
                } else {
                    let client = MSClientSetup.sharedInstance.client
                    client.loginWithProvider("facebook", token: ["access_token":result.token.tokenString], completion: { (user, error) -> Void in
                        if error != nil {
                            print("error: \(error.localizedDescription)")
                        } else {
                            self.dismissViewControllerAnimated(true, completion: nil)
                        }
                    })
                }
            }
        }
    }
}
