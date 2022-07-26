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
    
    let manager: NetworkManager
    
    init(manager: NetworkManager = NetworkManager()) {
        self.manager = manager
    }
    
    func fetchProduct(route: NetworkRouter, completion: @escaping (Result<ProductResponse, ProductError>) -> Void) {
        guard let request = manager.buildRequest(route: route) else { return }
        manager.loadRequest(request: request) { data, response, error in
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
}
