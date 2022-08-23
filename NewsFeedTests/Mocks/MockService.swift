//
// MockService.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 22/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation
@testable import NewsFeed

class MockService: INetworkService {
    
    static var articles = [
        Article(
            author: "Emmanuel Omokagbo",
            title: "The Guardian",
            urlToImage: "https://image.cnbcfm.com/api/v1/image/106839278-1613058216555SignifyHealth-OB-Photo-210211-PRESS-20-jpg?v=1613058263&w=1920&h=1080",
            url: "https://www.cnbc.com/2022/08/22/stocks-making-the-biggest-moves-in-the-premarket-signify-health-bed-bath-beyond-amc-and-more.html"
        ),
        Article(
            author: "Jamie Ross, Tess Homan",
            title: "WCVB Boston",
            urlToImage: "https://image.cnbcfm.com/api/v1/image/106839278-1613058216555SignifyHealth-OB-Photo-210211-PRESS-20-jpg?v=1613058263&w=1920&h=1080",
            url: "https://www.cnbc.com/2022/08/22/stocks-making-the-biggest-moves-in-the-premarket-signify-health-bed-bath-beyond-amc-and-more.html"
        ),
        Article(
            author: nil,
            title: nil,
            urlToImage: "https://image.cnbcfm.com/api/v1/image/106839278-1613058216555SignifyHealth-OB-Photo-210211-PRESS-20-jpg?v=1613058263&w=1920&h=1080",
            url: "https://www.cnbc.com/2022/08/22/stocks-making-the-biggest-moves-in-the-premarket-signify-health-bed-bath-beyond-amc-and-more.html"
        )
    ]
    static var mockNews = News.stub(status: "ok", totalResults: 30, articles: articles)
    
    var fetchNewsResult: Result<News, Error>?
    
    func fetch(completion: @escaping (Result<News, Error>) -> Void) {
        if let result = fetchNewsResult {
            completion(result)
        }
    }
    
    func fetch<T: Codable>(route: Route, method: HTTPMethod, type: T.Type, parameters: BodyParam?, completionHandler: @escaping (Result<T, Error>) -> Void) {
        
    }
    
}
