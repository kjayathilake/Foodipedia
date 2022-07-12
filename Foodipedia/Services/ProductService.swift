//
//  ProductService.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-12.
//

import Foundation

protocol ProductService: AnyObject {
    func fetchProduct(route: NetworkRouter, completion: @escaping (Result<ProductResponse, ProductError>) -> Void)
}

class ProductServiceImpl: ProductService {
    
    func fetchProduct(route: NetworkRouter, completion: @escaping (Result<ProductResponse, ProductError>) -> Void) {
        guard let request = buildRequest(route: route) else { return }
        loadRequest(request: request) { data, response, error in
            DispatchQueue.main.async {

                guard error == nil, data != nil, let response = response as? HTTPURLResponse else {
                    completion(.failure(.somethingWentWrong))
                    return
                }
                
                guard response.statusCode == 200 else {
                    if response.statusCode == 404 {
                        completion(.failure(.productNotFound))
                    } else {
                        completion(.failure(.somethingWentWrong))
                    }
                    return
                }
                
                let decoder = JSONDecoder()
                guard let item = try? decoder.decode(ProductResponse.self, from: data!) else {
                    completion(.failure(.somethingWentWrong))
                    return
                }
                completion(.success(item))
            }
        }
    }
    
    private func loadRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
    
    private func buildRequest(route: NetworkRouter) -> URLRequest? {
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
