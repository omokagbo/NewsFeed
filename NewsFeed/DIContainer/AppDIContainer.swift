//
// AppDIContainer.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation

class AppDIContainer {
    
    static func makeNewsListController() -> NewsListController {
        let vc = NewsListController()
        return vc
    }
    
}
