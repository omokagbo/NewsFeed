//
// Logger.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

enum LogType {
    case success
    case error
    case info
}

class Logger {
    
    static func printIfDebug(data: String, logType: LogType) {
        #if DEBUG
        switch logType {
        case .success:
            print("🟢🟢🟢", data)
        case .error:
            print("🛑🛑🛑", data)
        case .info:
            print("🟡🟡🟡", data)
        }
        #endif
    }
    
}
