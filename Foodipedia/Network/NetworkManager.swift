//
//  NetworkManager.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-26.
//

import Foundation

class NetworkManager {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func loadRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = session.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
    
    func buildRequest(route: NetworkRouter) -> URLRequest? {
        var components = URLComponents(string: route.baseURL)!
        components.path = route.path
        var queryItems: [URLQueryItem] = []
        for (key, value) in route.params {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        components.queryItems = queryItems
        var request = URLRequest(url: components.url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod
        
        return request
    }
}
