//
// Code+Extension.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

typealias BodyParam = [String: Any]
typealias NoParamHandler = (() -> Void)

let reachability = try! Reachability()
