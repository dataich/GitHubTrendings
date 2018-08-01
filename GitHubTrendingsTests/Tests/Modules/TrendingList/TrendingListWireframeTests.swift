//
//  TrendingsListWireframeTests.swift
//  GitHubTrendingsTests
//
//  Created by Taichiro Yoshida on 2018/08/03.
//  Copyright © 2018 Taichiro Yoshida. All rights reserved.
//

import XCTest
import UIKit
import SafariServices
@testable import GitHubTrendings

class TrendingListWireframeTests: XCTestCase {

  let interactor = TrendingListInteractor()
  let wireframe = RootWireframe()

  func testPresentTrendingList() {
    let navigationController = UINavigationController()
    wireframe.trendingsWireframe.presentTrendingList(from: navigationController)
    XCTAssertEqual(wireframe.trendingsWireframe.viewController.navigationController, navigationController)
  }

  func testPresentTrendingDetail() {
    let wireframe = RootWireframe()
    wireframe.presentTrendingsScreen(in: UIWindow())
    let tw = wireframe.trendingsWireframe

    XCTAssertNil(tw.viewController.presentedViewController)

    tw.presentTrendingDetail(trending: Trending(name: "", description: ""))

    XCTAssertTrue(tw.viewController.presentedViewController?.isKind(of: SFSafariViewController.self) ?? false)
  }
}
