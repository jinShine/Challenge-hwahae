//
//  ProductDetailViewModelTest.swift
//  hwaheaTests
//
//  Created by seungjin on 2020/01/26.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation
import XCTest
@testable import hwahea

class ProductDetailViewModelTest: XCTestCase {
  
  var viewModel: ProductDetailViewModelProtocol!
  var id: Int = 100
  
  override func setUp() {
    super.setUp()
    
    setupViewModel(stub: .product_detail)
    
    expectation { expectation in
      self.viewModel.fetchProduct(id: self.id) { response in
        expectation.fulfill()
      }
    }
  }
  
  override func tearDown() {
    viewModel = nil
    super.tearDown()
  }
  
  func setupViewModel(stub: StubType) {
    let networkServiceStub = NetworkServiceStub(stub: .product_detail)
    let productInteractor = ProductInteractor(service: networkServiceStub)
    viewModel = ProductDetailViewModel(productInteractor: productInteractor)
  }
  
  func testViewModel_whenFetchProduct_isResponseValidation() {
    
    //given
    
    //when
    expectation { expectation in
      self.viewModel.fetchProduct(id: self.id) { response in
        guard let data = response.json as? ProductDetailModel else {
          XCTFail("response data nil")
          return
        }
        
        //then
        XCTAssertNil(response.error)
        XCTAssertEqual(response.result, .success)
        XCTAssertEqual(data.statusCode, 200)
        
        expectation.fulfill()
      }
    }
  }
  
  func testNumberOfSections() {
    XCTAssertEqual(viewModel.numberOfSections(), 1)
  }
  
  func testNumberOfRowsInSections() {
    XCTAssertEqual(viewModel.numberOfRowsInSection(), ProductDetailViewModel.CellType.totalCount.rawValue)
  }
  
}

