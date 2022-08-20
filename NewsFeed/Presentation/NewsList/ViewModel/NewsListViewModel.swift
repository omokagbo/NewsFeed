//
// NewsListViewModel.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation

protocol INewsListViewModel {
    var newsFeed: [Article] { get }
    var showNewsFeed: (() -> Void)? { get set }
    var showError: ((Error) -> Void)? { get set }
    func fetchNews()
}

class NewsListViewModel: INewsListViewModel {
    
    var newsFeed = [Article]()
    var showNewsFeed: (() -> Void)?
    var showError: ((Error) -> Void)?
    
    fileprivate var newsListRepository: INewsListRepository
    
    init(newsListRepo: INewsListRepository) {
        self.newsListRepository = newsListRepo
    }
    
    func fetchNews() {
        newsListRepository.fetchNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let news):
                self.newsFeed = news.articles ?? []
                self.showNewsFeed?()
            case .failure(let error):
                self.showError?(error)
                debugPrint("Error", error)
            }
        }
    }
}
