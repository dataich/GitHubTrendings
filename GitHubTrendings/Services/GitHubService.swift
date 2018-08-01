//
// Created by Taichiro Yoshida on 2018/07/31.
// Copyright (c) 2018 Taichiro Yoshida. All rights reserved.
//

import Alamofire

class GitHubService: NSObject {
  enum Result<T> {
    case success(result: T)
    case failure(error: Error)
  }

  let url = "https://github.com/trending"

  func fetchTrendings(callback: @escaping (Result<[GitHubTrending]>) -> Void) throws {
    Alamofire.request(url).responseString { (response) in
      switch response.result {
      case .success(let html):
        let trendings = GitHubParser.parseTrendings(html: html)
        callback(Result.success(result: trendings))
      case .failure(let error):
        callback(Result.failure(error: error))
      }
    }
  }
}
