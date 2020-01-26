//
//  ProductCellViewModelTest.swift
//  hwaheaTests
//
//  Created by seungjin on 2020/01/26.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import XCTest
@testable import hwahea

class ProductCellViewModelTest: XCTestCase {
  
  var product: Product!
  
  override func setUp() {
    super.setUp()
    
    expectation { expectation in
      Mocker.product(
        stub: .all_product,
        to: .productList(skinType: "oily", page: 1)) { response in
          self.product = response
          expectation.fulfill()
      }
    }
  }
  
  override func tearDown() {
    product = nil
    super.tearDown()
  }
  
  func testProduct_notNil() {
    XCTAssertNotNil(product)
  }
  
  func testImageURL() {
    let viewModel = ProductCellViewModel(product: product)
    
    XCTAssertEqual(viewModel.productImageURL?.absoluteString, product.thumbnailImage ?? "")
  }
  
  func testTitleInfo() {
    let viewModel = ProductCellViewModel(product: product)
    
    XCTAssertEqual(viewModel.titleInfo, product.title)
  }
  
  func testPriceInfo() {
    let viewModel = ProductCellViewModel(product: product)
    
    XCTAssertEqual(viewModel.priceInfo, product.price + "원")
  }
  
}
