//
// Route.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

enum Route {
    case topHeadlines
    
    var description: String {
        switch self {
        case .topHeadlines:
            return "top-headlines"
        }
    }
}
