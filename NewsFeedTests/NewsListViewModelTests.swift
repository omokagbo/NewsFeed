//
// NewsListViewModelTests.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 21/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import XCTest
@testable import NewsFeed

class NewsListViewModelTests: XCTestCase {
    
    func test_Can_Parse_Data() {
        // given
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "NewsStub", ofType: "json") else {
            fatalError("unable to get pathString")
        }
        
        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8)  else {
            fatalError("unable to get json string")
        }
        
        // when
        let jsonData = json.data(using: .utf8)!
        let newsData = try! JSONDecoder().decode(News.self, from: jsonData)
        
        // then
        XCTAssertEqual(newsData.totalResults, 38)
        XCTAssertEqual(newsData.articles?.count, 20)
        XCTAssertEqual(newsData.articles?[0].author, "Jamie Ross, Tess Homan")
    }
    
    func test_Can_Handle_Null_Values() {
        // given
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "NewsStub", ofType: "json") else {
            fatalError("unable to get pathString")
        }
        
        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8)  else {
            fatalError("unable to get json string")
        }
        
        // when
        let jsonData = json.data(using: .utf8)!
        let newsData = try! JSONDecoder().decode(News.self, from: jsonData)
        
        // then
        XCTAssertNil(newsData.articles?[1].author)
        XCTAssertNil(newsData.articles?[2].url)
    }
    
}
