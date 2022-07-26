//
//  DomainError.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-09.
//

import Foundation

protocol DomainError: Error {
    var localizedDescription: String { get }
}

extension DomainError {
    var defaultError: String {
        return Constants.genericError
    }
}

enum ProductError: DomainError {
    case productNotFound
    case somethingWentWrong
    
    var localizedDescription: String {
        switch self {
        case .productNotFound:
            return Constants.productNotFound
        case .somethingWentWrong:
            return defaultError
        }
    }
}
