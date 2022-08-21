//
// CachedImageView.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 21/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

public final class CachedImageView: UIImageView {
    
    private let cache = NSCache<NSString, UIImage>()
    
    func fetchImage(with url: String) {
        let urlString = url
        if let cachedImage = cache.object(forKey: NSString(string: url)) {
            DispatchQueue.main.async { [weak self] in
                self?.image = cachedImage
                return
            }
        }
        
        guard let url = URL(string: urlString) else {
            Logger.printIfDebug(data: "unable to get image url", logType: .error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }
            if let error = error {
                Logger.printIfDebug(data: "\(error): , \(error.localizedDescription) found in cachedImage", logType: .error)
            }
            if let data = data {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    guard let image = UIImage(data: data) else { return }
                    self.image = image
                    self.cache.setObject(image, forKey: NSString(string: urlString))
                }
            }
        }
        task.resume()
    }
    
}
