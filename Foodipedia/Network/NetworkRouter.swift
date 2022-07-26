//
//  NetworkRouter.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-12.
//

import Foundation

enum NetworkRouter {
    
    case productDetails(id: Int)
    
    var baseURL: String {
        return "https://api.lifesum.com"
    }
    
    var httpMethod: String {
        switch self {
        case .productDetails:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .productDetails:
            return "/v2/foodipedia/codetest"
        }
    }
    
    var params: [String: String] {
        switch self {
        case .productDetails(id: let id):
            return ["foodid": "\(id)"]
        }
    }
}
