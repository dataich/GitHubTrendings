//
//  TrendingListPresenter.swift
//  GitHubTrendings
//
//  Created by Taichiro Yoshida on 2018/07/31.
//  Copyright (c) 2018 Taichiro Yoshida. All rights reserved.
//

protocol TrendingListPresenterProtocol: class {
  func updateView()
  func didSelectTrending(_ trending: Trending)
  func trendingsFetched(trendings: [Trending])
}

final class TrendingListPresenter {
  private unowned var view: TrendingListViewProtocol
  private var interactor: TrendingListInteractorInput
  private var wireframe: TrendingListWireframeProtocol

  init(wireframe: TrendingListWireframeProtocol, view: TrendingListViewProtocol,
       interactor: TrendingListInteractorInput) {
    self.wireframe = wireframe
    self.view = view
    self.interactor = interactor
  }
}

extension TrendingListPresenter: TrendingListPresenterProtocol {
  func updateView() {
    interactor.fetchTrendings()
  }

  func didSelectTrending(_ trending: Trending) {
    wireframe.presentTrendingDetail(trending: trending)
  }
}

extension TrendingListPresenter: TrendingListInteractorOutput {
  func trendingsFetched(trendings: [Trending]) {
    if trendings.count > 0 {
      view.showTrendings(trendings: trendings)
    } else {
      view.showNoContent()
    }
  }
}
