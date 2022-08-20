//
// String+Extension.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
