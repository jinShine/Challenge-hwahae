//
//  ProductDescriptionCellViewModelTest.swift
//  hwaheaTests
//
//  Created by seungjin on 2020/01/26.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import XCTest
@testable import hwahea

class ProductDescriptionCellViewModelTest: XCTestCase {
  
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
  
  func testDescription() {
    let viewModel = ProductDescriptionCellViewModel(description: product.description)
    
    XCTAssertEqual(viewModel.description, product.description?.replacingOccurrences(of: "\\n", with: "\n"))
  }
  
}
