//
//  TrendingListCell.swift
//  GitHubTrendings
//
//  Created by Taichiro Yoshida on 2018/07/31.
//  Copyright (c) 2018 Taichiro Yoshida. All rights reserved.
//

import UIKit

class TrendingListCell: UITableViewCell {
  var item: Trending! {
    didSet {
      configure()
    }
  }

  func configure() {
    textLabel?.text = item.name
    detailTextLabel?.text = item.description
  }
}
