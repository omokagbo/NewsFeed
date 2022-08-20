//
// NetworkError.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

public enum NetworkError: Error, LocalizedError {
    case error(statusCode: Int, data: Data?)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    case invalidData
}
