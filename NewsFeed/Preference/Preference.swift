//
// Preference.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 9/12/22
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

protocol IPreference {
    func get<T: Codable>(key: String, type: T.Type) -> T?
    func set<T: Codable>(key: String, newValue: T?, type: T.Type)
}

class LocalPreference: IPreference {
    private let preference = UserDefaults.standard
    
    func get<T: Codable>(key: String, type: T.Type) -> T? {
        if let savedData = preference.object(forKey: key) as? Data {
            do {
                return try JSONDecoder().decode(T.self, from: savedData)
            } catch {
                print(error)
                return nil
            }
        }
        return nil
    }
    
    func set<T: Codable>(key: String, newValue: T?, type: T.Type) {
        if newValue == nil {
            preference.removeObject(forKey: key)
            return
        }
        do {
            let encoded: Data = try JSONEncoder().encode(newValue)
            preference.set(encoded, forKey: key)
        } catch {
            print(error)
        }
    }
}
