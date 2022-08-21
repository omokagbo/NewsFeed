//
// AppConfiguration.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

final class AppConfiguration {
    
    static let baseURL: String = {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as? String else {
            debugPrint("unable to get baseURL 🛑🛑🛑")
            return ""
        }
        return url
    }()
    
    static let apiKey: String = {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else {
            debugPrint("unable to get apikey 🛑🛑🛑")
            return ""
        }
        return apiKey
    }()
}
