//
//  ProductViewModel.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-08.
//

import Foundation

/// Delegate for informing product view model updates
protocol ProductViewModelDelegate: AnyObject {
    func showLoading()
    func showProductInfo()
    func showError()
}

/// A view model for fetching product details
final class ProductViewModel {
    
    // MARK: Lifecycle
    
    init(service: ProductService = ProductServiceImpl()) {
        self.service = service
    }
    
    // MARK: Internal
    
    /// View delegate for informing view model changes
    weak var view: ProductViewModelDelegate?
    
    /// Nutrient information:  Product name
    var productName: String {
        self.product?.response.title.uppercased() ?? ""
    }
    
    /// Nutrient information:  Amount of Calories
    var calories: String {
        formattedCalorieAmount(amount: self.product?.response.calories)
    }
    
    /// Nutrient information:  Percentage of Carbs
    var carbs: String {
        formattedNutrientPercentage(amount: self.product?.response.carbs)
    }
    
    /// Nutrient information:  Percentage of Protein
    var protein: String {
        formattedNutrientPercentage(amount: self.product?.response.protein)
    }
    
    /// Nutrient information:  Percentage of Fat
    var fat: String {
        formattedNutrientPercentage(amount: self.product?.response.fat)
    }
    
    /// Error message if error is present
    var errorMessage: String {
        self.error?.localizedDescription ?? ""
    }
    
    /// Fetch product details of a randomly chosen product
    func fetchRandomProduct() {
        self.view?.showLoading()
        let productId = Int.random(in: 1...200)
        
        service.fetchProduct(route: .productDetails(id: productId), completion: { result in
            switch result {
            case .success(let response):
                self.product = response
                self.view?.showProductInfo()
            case .failure(let error):
                self.error = error
                self.view?.showError()
            }
        })
    }
    
    private func formattedNutrientPercentage(amount: Double?) -> String {
        return "\(String(format: "%.0f", amount ?? 0))%"
    }
    
    private func formattedCalorieAmount(amount: Double?) -> String {
        return "\(String(format: "%.0f", amount ?? 0))"
    }
    
    // MARK: Private
    
    private var product: ProductResponse?
    private var error: ProductError?
    private let service: ProductService
}
