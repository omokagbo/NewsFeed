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
    func monitorNetwork()
    func fetchNews()
}

class NewsListViewModel: INewsListViewModel {
    
    var newsFeed = [Article]()
    var showNewsFeed: (() -> Void)?
    var showError: ((Error) -> Void)?
    
    fileprivate var newsListRepository: INewsListRepository
    fileprivate var preference: IPreference
    
    init(newsListRepo: INewsListRepository, preference: IPreference) {
        self.newsListRepository = newsListRepo
        self.preference = preference
    }
    
    func monitorNetwork() {
        reachability.whenReachable = { [weak self] _ in
            guard let self = self else { return }
            self.fetchNews()
        }
        
        reachability.whenUnreachable = { [weak self] _ in
            guard let self = self else { return }
            self.newsFeed = self.preference.get(key: PreferenceConstants.OFFLINE_NEWS, type: [Article].self) ?? []
            self.showNewsFeed?()
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            Logger.printIfDebug(data: error.localizedDescription, logType: .error)
        }
    }
    
    func fetchNews() {
        newsListRepository.fetchNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let news):
                self.newsFeed = news.articles ?? []
                self.preference.set(key: PreferenceConstants.OFFLINE_NEWS, newValue: news.articles, type: [Article].self)
                self.showNewsFeed?()
            case .failure(let error):
                self.showError?(error)
            }
        }
    }
}
