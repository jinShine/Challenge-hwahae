//
//  ProductImageCellViewModelTest.swift
//  hwaheaTests
//
//  Created by seungjin on 2020/01/26.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import XCTest
@testable import hwahea

class ProductImageCellViewModelTest: XCTestCase {
  
  var id: Int = 100
  var product: Product!
  
  override func setUp() {
    super.setUp()
    
    expectation { expectation in
      Mocker.product(
        stub: .product_detail,
        to: .productDetail(id: self.id)) { response in
          self.product = response
          expectation.fulfill()
      }
    }
  }
  
  override func tearDown() {
    product = nil
    super.tearDown()
  }
  
  func testProductImageURL() {
    let viewModel = ProductImageCellViewModel(product: product)
    XCTAssertEqual(viewModel.productImageURL?.absoluteString, product.fullSizeImage)
  }
  
}
