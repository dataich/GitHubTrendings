//
//  TrendingListWireframe.swift
//  GitHubTrendings
//
//  Created by Taichiro Yoshida on 2018/07/31.
//  Copyright (c) 2018 Taichiro Yoshida. All rights reserved.
//

import UIKit
import SafariServices

protocol TrendingListWireframeProtocol {
  func presentTrendingList(from view: AnyObject)
  func presentTrendingDetail(trending: Trending)
}

final class TrendingListWireframe {

  weak var viewController: TrendingListViewController!

  init() {
    viewController = StoryboardScene.TrendingList.trendingListViewController.instantiate()

    let interactor = TrendingListInteractor()
    let presenter = TrendingListPresenter(wireframe: self, view: viewController, interactor: interactor)
    interactor.presenter = presenter

    viewController.presenter = presenter
  }
}

extension TrendingListWireframe: TrendingListWireframeProtocol {
  func presentTrendingList(from view: AnyObject) {
    if let view = view as? UINavigationController {
      view.setViewControllers([viewController], animated: true)
    }
  }

  func presentTrendingDetail(trending: Trending) {
    let sf = SFSafariViewController(url: URL(string: "https://github.com/\(trending.name)")!)
    viewController.present(sf, animated: true, completion: nil)
  }
}
