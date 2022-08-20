//
// ViewController.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

class NewsListController: BaseViewController {
    
    var newsListViewModel: INewsListViewModel?
    weak var newsListCoordinator: NewsListCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .systemBackground
        newsListViewModel?.fetchNews()
    }
    
}

