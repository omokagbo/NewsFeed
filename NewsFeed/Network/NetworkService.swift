//
// NetworkService.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

protocol INetworkService {
    func fetch<T:Codable> (route: Route, method: HTTPMethod, type: T.Type, parameters: BodyParam?, completionHandler: @escaping (Result<T, Error>) -> Void)
}

class RemoteNetworkService: INetworkService {
    func fetch<T>(route: Route, method: HTTPMethod, type: T.Type, parameters: BodyParam?, completionHandler: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        let urlString = "\(AppConfiguration.baseURL)\(route.description)"
        guard let url = urlString.asURL else {
            Logger.printIfDebug(data: "unable to get url", logType: .error)
            return
        }
        
        Logger.printIfDebug(data: "\(url)", logType: .success)
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = method.rawValue
        
        request.cachePolicy = .returnCacheDataDontLoad
        
        reachability.whenUnreachable = { _ in
            request.cachePolicy = .returnCacheDataDontLoad
        }
        
        reachability.whenReachable = { _ in
            request.cachePolicy = .reloadIgnoringCacheData
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            Logger.printIfDebug(data: error.localizedDescription, logType: .error)
        }
        
        if let parameters = parameters {
            Logger.printIfDebug(data: "Parameter: \(parameters)", logType: .success)
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = parameters.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                request.url = urlComponent?.url
            case .post, .delete, .patch, .head, .put:
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                request.httpBody = bodyData
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
                Logger.printIfDebug(data: "\(error), \(error.localizedDescription)", logType: .error)
            }
            
            if let response = response {
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
                if statusCode > 400 {
                    completionHandler(.failure(NetworkError.error(statusCode: statusCode, data: nil)))
                }
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(response))
                    Logger.printIfDebug(data: "\(response)", logType: .success)
                } catch let error {
                    completionHandler(.failure(error))
                }
            } else {
                completionHandler(.failure(NetworkError.invalidData))
            }
        }
        
        task.resume()
        
    }
}
