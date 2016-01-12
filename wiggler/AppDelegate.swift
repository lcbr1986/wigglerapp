//
//  AppDelegate.swift
//  wiggler
//
//  Created by Luis Carlos Rosa on 04/01/16.
//  Copyright © 2016 Wiggler. All rights reserved.
//

import UIKit

let ViewControllerIdentifier = "ViewController"
let LoginViewControllerIdentifier = "LoginView"
let HomeNavigationControllerIdentifier = "HomeNavigation"
let HomeViewControllerIdentifier = "HomeView"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    let appDependencies = AppDependencies()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let navigationController = navigationControllerFromWindow(window!)
        navigationController.viewControllers = [viewControllerFromStoryboard()]
        return true
    }

    func viewControllerFromStoryboard() -> ViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(ViewControllerIdentifier) as! ViewController
        return viewController
    }
    
    func loginViewControllerFromStoryboard() -> LoginViewController {
        let storyboard = mainStoryboard()
        let loginViewcontroller = storyboard.instantiateViewControllerWithIdentifier(LoginViewControllerIdentifier) as! LoginViewController
        return loginViewcontroller
    }
    
    func homeViewControllerFromStoryboard() -> UINavigationController {
        let storyboard = homeStoryboard()
        let homeViewController = storyboard.instantiateViewControllerWithIdentifier(HomeNavigationControllerIdentifier) as! UINavigationController
        return homeViewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
    func homeStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Home", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
    func navigationControllerFromWindow(window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
}

