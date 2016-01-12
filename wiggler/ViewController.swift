//
//  ViewController.swift
//  wiggler
//
//  Created by Luis Carlos Rosa on 04/01/16.
//  Copyright © 2016 Wiggler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let client = MSClientSetup.sharedInstance.client
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // Check if is logged in
        // If so, goes to Home
        // If not, goes to login
        goToNextScreen()
    }
    func checkLogin() -> Bool{
        // Goes to local store and checks if the user is logged in
        if client.currentUser != nil {
            return true
        }
        return false
    }
    
    func goToNextScreen() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if checkLogin() {
            let homeViewController = appDelegate.homeViewControllerFromStoryboard()
            homeViewController.modalTransitionStyle = .CrossDissolve
            self.presentViewController(homeViewController, animated: true, completion: nil)
        } else {
            // Go to Login
            let loginViewController = appDelegate.loginViewControllerFromStoryboard()
            loginViewController.modalTransitionStyle = .CrossDissolve
            self.presentViewController(loginViewController, animated: true, completion: nil)
        }
    }
    
}

