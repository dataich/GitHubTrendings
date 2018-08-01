//
//  TrendingListPresenterTests.swift
//  GitHubTrendingsTests
//
//  Created by Taichiro Yoshida on 2018/08/03.
//  Copyright © 2018 Taichiro Yoshida. All rights reserved.
//

import XCTest
@testable import GitHubTrendings

class TrendingListPresenterTests: XCTestCase {

  class MockTrendingListViewController: TrendingListViewProtocol {

    var showTrendingsCount = 0
    func showTrendings(trendings: [Trending]) {
      showTrendingsCount += 1
    }

    var showNoContentCount = 0
    func showNoContent() {
      showNoContentCount += 1
    }
  }

  var view: MockTrendingListViewController!
  var presenter: TrendingListPresenter!

  override func setUp() {
    super.setUp()

    view = MockTrendingListViewController()
    presenter = TrendingListPresenter(wireframe: TrendingListWireframe(), view: view, interactor: TrendingListInteractor())
  }

  func testTrendingsFetched() {
    XCTAssertEqual(view.showTrendingsCount, 0)
    presenter.trendingsFetched(trendings: [Trending(name: "", description: "")])
    XCTAssertEqual(view.showTrendingsCount, 1)

    XCTAssertEqual(view.showNoContentCount, 0)
    presenter.trendingsFetched(trendings: [])
    XCTAssertEqual(view.showNoContentCount, 1)
  }
}
