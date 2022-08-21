//
// News+Stub.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 21/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation

extension News {
    static func stub(status: String? = "", totalResults: Int = 0, articles: [Article]) -> Self {
        News(status: status, totalResults: totalResults, articles: articles)
    }
}
