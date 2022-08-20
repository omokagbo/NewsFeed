//
// NewsListRepository.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

protocol INewsListRepository {
    func fetchNews(completionHandler: @escaping (Result<News, Error>) -> Void)
}

class NewsListRepository: INewsListRepository {
    
    fileprivate var remoteDataSource: INetworkService
    
    init(remoteDataSource: INetworkService) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchNews(completionHandler: @escaping (Result<News, Error>) -> Void) {
        var params = BodyParam()
        params["country"] = "us"
        params["apiKey"] = AppConfiguration.apiKey
        remoteDataSource.fetch(route: .topHeadlines, method: .get, type: News.self, parameters: params) { result in
            switch result {
            case .success(let news):
                completionHandler(.success(news))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
