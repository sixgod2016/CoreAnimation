//
//  AppDelegate.swift
//  CoreAnimationDemo
//
//  Created by GDM on 2021/7/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let root = ViewController()
    let navi = UINavigationController(rootViewController: root)
    window = UIWindow()
    window?.rootViewController = navi
    window?.makeKeyAndVisible()
    
    return true
  }
 

}

