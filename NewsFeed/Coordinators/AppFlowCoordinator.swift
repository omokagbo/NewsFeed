//
// AppFlowCoordinator.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

final class AppFlowCoordinator: BaseCoordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        showNewsList(navigationController: navigationController)
        window.makeKeyAndVisible()
    }
    
    func showNewsList(navigationController: UINavigationController) {
        let coordinator = AppDIContainer.makeNewsListCoordinator(navigationController: navigationController)
        store(coordinator: coordinator)
        coordinator.start()
    }
    
    deinit {
        print("AppFlowCoordinator removed")
    }
    
}
