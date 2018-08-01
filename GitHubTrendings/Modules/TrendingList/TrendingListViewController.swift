//
//  TrendingListViewController.swift
//  GitHubTrendings
//
//  Created by Taichiro Yoshida on 2018/07/31.
//  Copyright (c) 2018 Taichiro Yoshida. All rights reserved.
//

import UIKit

public struct Trending {
  public let name: String
  public let description: String
}

protocol TrendingListViewProtocol: class {
  func showTrendings(trendings: [Trending])
  func showNoContent()
}

final class TrendingListViewController: UIViewController {

  var presenter: TrendingListPresenterProtocol!

  @IBOutlet weak var tableView: UITableView!

  var trendings: [Trending] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.updateView()
  }
}

extension TrendingListViewController: TrendingListViewProtocol {
  func showTrendings(trendings: [Trending]) {
    self.trendings = trendings
    tableView.reloadData()
  }

  func showNoContent() {

  }
}

extension TrendingListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return trendings.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Trending", for: indexPath)

    if let cell = cell as? TrendingListCell {
      cell.item = trendings[indexPath.row]
    }

    return cell
  }
}

extension TrendingListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.didSelectTrending(trendings[indexPath.row])
  }
}
