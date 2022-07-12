//
//  MockAPIRequest.swift
//  FoodipediaTests
//
//  Created by Krishantha Jayathilake on 2022-07-12.
//

import Foundation
@testable import Foodipedia

class ProductServiceMock: ProductService {
    
    var shouldSuccess: Bool = true
    
    func fetchProduct(route: NetworkRouter, completion: @escaping (Result<ProductResponse, ProductError>) -> Void) {
        if shouldSuccess {
            
            let meta = Meta(code: 200)
            let response = Response(
                title: "Pork frankfurter",
                calories: 269,
                carbs: 0.28,
                protein: 12.81,
                fat: 23.68,
                saturatedfat: 8.719,
                unsaturatedfat: 13.123,
                fiber: 0.1,
                cholesterol: 0.066,
                sugar: 0.0,
                sodium: 0.816,
                potassium: 0.264,
                gramsperserving: 76.0,
                pcstext: "Whole frankfurter"
            )
            let product = ProductResponse(meta: meta, response: response)
            
            completion(.success(product))
        } else {
            completion(.failure(.productNotFound))
        }
    }
}
