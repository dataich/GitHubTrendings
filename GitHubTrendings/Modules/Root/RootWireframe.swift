//
//  RootWireframe.swift
//  GitHubTrendings
//
//  Created by Taichiro Yoshida on 2018/07/31.
//  Copyright (c) 2018 Taichiro Yoshida. All rights reserved.
//

import UIKit

protocol RootWireframeInterface: class {
  func presentTrendingsScreen(in: UIWindow)
}

final class RootWireframe {
  var trendingsWireframe = TrendingListWireframe()
}

extension RootWireframe: RootWireframeInterface {
  func presentTrendingsScreen(in window: UIWindow) {
    let rootViewController = StoryboardScene.Root.initialScene.instantiate()
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()

    trendingsWireframe.presentTrendingList(from: rootViewController)
  }
}
