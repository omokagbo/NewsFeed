//
// NewsListCoordinator.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

final class NewsListCoordinator: BaseCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        showNewsList()
    }
    
    fileprivate func showNewsList() {
        let vc = AppDIContainer.makeNewsListController()
        vc.newsListCoordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showNewsDetailsFor(_ news: Article) {
        let vc = AppDIContainer.makeNewsDetailsController()
        vc.news = news
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
