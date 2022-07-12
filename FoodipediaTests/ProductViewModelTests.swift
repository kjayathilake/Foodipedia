//
//  FoodipediaTests.swift
//  FoodipediaTests
//
//  Created by Krishantha Jayathilake on 2022-07-07.
//

import XCTest
@testable import Foodipedia

class ProductViewModelTests: XCTestCase {

    override func setUp() {
        productService = ProductServiceMock()
        delegate = ProductViewModelDelegateMock()
    }
    
    override func tearDown() {
        delegate = nil
        productService = nil
    }
    
    func testLoadDataSuccessfully() {
        productService.shouldSuccess = true
        let sut = ProductViewModel(service: productService)
        sut.view = delegate
        sut.fetchRandomProduct()
        
        XCTAssertTrue(delegate.reachedLoadingBlock)
        XCTAssertTrue(delegate.reachedProductInfoBlock)
        XCTAssertFalse(delegate.reachedErrorBlock)
        
        XCTAssertEqual(sut.productName, "PORK FRANKFURTER")
        XCTAssertEqual(sut.calories, "269")
        XCTAssertEqual(sut.carbs, "0%")
        XCTAssertEqual(sut.protein, "13%")
        XCTAssertEqual(sut.fat, "24%")
        
        XCTAssertEqual(sut.errorMessage, "")
    }
    
    func testLoadDataWithError() {
        productService.shouldSuccess = false
        let sut = ProductViewModel(service: productService)
        sut.view = delegate
        sut.fetchRandomProduct()
        
        XCTAssertTrue(delegate.reachedLoadingBlock)
        XCTAssertFalse(delegate.reachedProductInfoBlock)
        XCTAssertTrue(delegate.reachedErrorBlock)
        
        XCTAssertEqual(sut.errorMessage, "Product not found")
        
        XCTAssertEqual(sut.productName, "")
        XCTAssertEqual(sut.calories, "0")
        XCTAssertEqual(sut.carbs, "0%")
        XCTAssertEqual(sut.protein, "0%")
        XCTAssertEqual(sut.fat, "0%")
    }
    
    private var productService: ProductServiceMock!
    private var delegate: ProductViewModelDelegateMock!
}

fileprivate final class ProductViewModelDelegateMock: ProductViewModelDelegate {
    
    var reachedLoadingBlock = false
    var reachedProductInfoBlock = false
    var reachedErrorBlock = false
    
    func showLoading() {
        reachedLoadingBlock = true
    }
    
    func showProductInfo() {
        reachedProductInfoBlock = true
    }
    
    func showError() {
        reachedErrorBlock = true
    }
}
