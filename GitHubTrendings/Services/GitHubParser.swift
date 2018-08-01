//
//  GitHubParser.swift
//  GitHubTrendings
//
//  Created by Taichiro Yoshida on 2018/07/31.
//  Copyright © 2018 Taichiro Yoshida. All rights reserved.
//

import Kanna

public struct GitHubTrending {
  public let name: String
  public let description: String
}

class GitHubParser: NSObject {
  static let shared: GitHubParser = GitHubParser()

  private override init() {
  }

  class func parseTrendings(html: String) -> [GitHubTrending] {
    guard let doc = try? HTML(html: html, encoding: String.Encoding.utf8) else {
      return []
    }

    let trendings = doc.xpath("//ol[@class='repo-list']/li").compactMap { (li) -> GitHubTrending? in
      let a = li.xpath("div[1]/h3[1]/a").first
      let p = li.xpath("div[3]/p").first

      if let name = a?["href"], let description = p?.text {
        return GitHubTrending(
            name: name[name.index(name.startIndex, offsetBy: 1)...].trimmingCharacters(in: .whitespacesAndNewlines),
            description: description.trimmingCharacters(in: .whitespacesAndNewlines)
        )
      }

      return nil
    }

    return trendings
  }
}
