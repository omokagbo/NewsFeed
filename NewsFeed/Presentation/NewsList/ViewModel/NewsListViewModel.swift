//
// NewsListViewModel.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation

protocol INewsListViewModel {
    func fetchNews()
}

class NewsListViewModel: INewsListViewModel {
    
    fileprivate var newsListRepository: INewsListRepository
    
    init(newsListRepo: INewsListRepository) {
        self.newsListRepository = newsListRepo
    }
    
    func fetchNews() {
        newsListRepository.fetchNews { result in
            switch result {
            case .success(let news):
                debugPrint("News returned", news)
            case .failure(let error):
                debugPrint("Error", error)
            }
        }
    }
}
