//
// AppDIContainer.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

class AppDIContainer {
    
    static func makeNetworkService() -> INetworkService {
        return RemoteNetworkService()
    }
    
    static func makeNewsListRepository() -> INewsListRepository {
        return NewsListRepository(remoteDataSource: makeNetworkService())
    }
    
    static func makeNewsListViewModel() -> INewsListViewModel {
        return NewsListViewModel(newsListRepo: makeNewsListRepository())
    }
    
    static func makeNewsListController() -> NewsListController {
        let vc = NewsListController()
        vc.newsListViewModel = makeNewsListViewModel()
        return vc
    }
    
    static func makeNewsDetailsController() -> NewsDetailsViewController {
        let vc = NewsDetailsViewController()
        return vc
    }
    
    static func makeNewsListCoordinator(navigationController: UINavigationController) -> NewsListCoordinator {
        return NewsListCoordinator(navigationController: navigationController)
    }
}
