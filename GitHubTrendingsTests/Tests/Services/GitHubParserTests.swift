//
//  GitHubParserTests.swift
//  GitHubTrendingsTests
//
//  Created by Taichiro Yoshida on 2018/07/31.
//  Copyright © 2018 Taichiro Yoshida. All rights reserved.
//

import XCTest
@testable import GitHubTrendings

class GitHubParserTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testParseTrendings() {
    let bundle = Bundle(for: type(of: self))
    let url = bundle.url(forResource: "trendings", withExtension: "html")!
    let html = try! String(contentsOf: url, encoding: String.Encoding.utf8)
    let trendings = GitHubParser.parseTrendings(html: html)
    
    XCTAssertEqual(trendings.count, 25)
    
    do {
      let t = trendings[0]
      XCTAssertEqual(t.name, "jxnblk/mdx-deck")
      XCTAssertEqual(t.description, "MDX-based presentation decks")
    }
    
    do {
      let t = trendings[2]
      XCTAssertEqual(t.name, "trekhleb/javascript-algorithms")
      XCTAssertEqual(t.description, "Algorithms and data structures implemented in JavaScript with explanations and links to further readings")
    }
  }
}
