//
//  ProductResponse.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-09.
//

import Foundation

// MARK: ProductResponse
struct ProductResponse: Codable {
    let meta: Meta
    let response: Response
}

// MARK: Meta
struct Meta: Codable {
    let code: Int
}

// MARK: Response
struct Response: Codable {
    let title: String
    let calories: Double
    let carbs, protein, fat, saturatedfat: Double
    let unsaturatedfat: Double
    let fiber: Double
    let cholesterol, sugar, sodium, potassium: Double
    let gramsperserving: Double
    let pcstext: String
}
