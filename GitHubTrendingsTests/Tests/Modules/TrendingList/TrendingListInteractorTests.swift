//
//  TrendingListInteractorTests.swift
//  GitHubTrendingsTests
//
//  Created by Taichiro Yoshida on 2018/08/02.
//  Copyright © 2018 Taichiro Yoshida. All rights reserved.
//

import XCTest
@testable import GitHubTrendings

class TrendingListInteractorTests: XCTestCase {

  class MockGitHubService: GitHubService {
    override func fetchTrendings(callback: @escaping (Result<[GitHubTrending]>) -> Void) throws {
      let trendings = [
        GitHubTrending(name: "dataich/repo1", description: "repo1"),
        GitHubTrending(name: "dataich/repo2", description: "repo2")
      ]
      callback(Result.success(result: trendings))
    }
  }

  class MockTrendingListInteractorOutput: TrendingListInteractorOutput {
    var trendingsFetchedCount = 0

    func trendingsFetched(trendings: [Trending]) {
      trendingsFetchedCount += 1
    }
  }

  let interactor = TrendingListInteractor()
  let githubService = MockGitHubService()
  let presenter = MockTrendingListInteractorOutput()

  override func setUp() {
    super.setUp()

    interactor.githubService = githubService
    interactor.presenter = presenter
  }

  func testFetchTrendings() {
    interactor.fetchTrendings()
    XCTAssertEqual(presenter.trendingsFetchedCount, 1)

    interactor.fetchTrendings()
    XCTAssertEqual(presenter.trendingsFetchedCount, 2)
  }
}
