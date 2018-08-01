//
//  AppDelegate.swift
//  GitHubTrendings
//
//  Created by Taichiro Yoshida on 2018/07/31.
//  Copyright (c) 2018 Taichiro Yoshida. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
  var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    RootWireframe().presentTrendingsScreen(in: window!)

    return true
  }
}
