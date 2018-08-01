//
//  TrendingListInteractor.swift
//  GitHubTrendings
//
//  Created by Taichiro Yoshida on 2018/07/31.
//  Copyright (c) 2018 Taichiro Yoshida. All rights reserved.
//

protocol TrendingListInteractorInput: class {
  func fetchTrendings()
}

protocol TrendingListInteractorOutput: class {
  func trendingsFetched(trendings: [Trending])
}

final class TrendingListInteractor {
  weak var presenter: TrendingListInteractorOutput!

  var githubService: GitHubService = GitHubService()

  init() {}
}

extension TrendingListInteractor: TrendingListInteractorInput {
  func fetchTrendings() {
    try? githubService.fetchTrendings { result in
      switch result {
      case .success(let githubTrendings):
        self.presenter.trendingsFetched(trendings: githubTrendings.map { gt -> Trending in
          return Trending(name: gt.name, description: gt.description)
        })
      case .failure:
        self.presenter.trendingsFetched(trendings: [])
      }
    }
  }
}
