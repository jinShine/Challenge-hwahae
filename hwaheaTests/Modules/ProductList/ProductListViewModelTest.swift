//
//  ProductListViewModelTest.swift
//  hwaheaTests
//
//  Created by seungjin on 2020/01/25.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation
import XCTest
@testable import hwahea

class ProductListViewModelTest: XCTestCase {
  
  var viewModel: ProductListViewModelProtocol!

  override func setUp() {
    super.setUp()
    
    setupViewModel(stub: .all_product)
    
    expectation { expectation in
      self.viewModel.fetchProduct(skinType: "oliy", page: 1) { response in
        expectation.fulfill()
      }
    }
  }
  
  override func tearDown() {
    viewModel = nil
    super.tearDown()
  }
  
  func setupViewModel(stub: StubType) {
    let networkServiceStub = NetworkServiceStub(stub: stub)
    let productInteractor = ProductInteractor(service: networkServiceStub)
    viewModel = ProductListViewModel(productInteractor: productInteractor)
  }
  
  func testViewModel_whenFetchProduct_isResponseVaildation() {
    
    //given
    
    //when
    expectation { expectation in
      self.viewModel.fetchProduct(skinType: "oliy", page: 1, completion: { response in
        guard let data = response.json as? ProductsModel else {
          XCTFail("response data nil")
          return
        }
        
        //then
        XCTAssertNil(response.error)
        XCTAssertEqual(response.result, .success)
        XCTAssertEqual(data.statusCode, 200)
        XCTAssertFalse(data.body.isEmpty)
        expectation.fulfill()
      })
    }
  }
  
  func testViewModel_whenFetchProductType_isResponseVaildation() {

    //given
    setupViewModel(stub: .skin_type_product_success)

    //when
    expectation { expectation in
      self.viewModel.fetchProduct(skinType: "dry", page: 1, completion: { response in
        guard let data = response.json as? ProductsModel else {
          XCTFail("response data nil")
          return
        }

        //then
        XCTAssertNil(response.error)
        XCTAssertEqual(response.result, .success)
        XCTAssertEqual(data.statusCode, 200)
        XCTAssertFalse(data.body.isEmpty)
        expectation.fulfill()
      })
    }
  }

  func testViewModel_whenWrongType_isErrorNotNil() {

    //given
    setupViewModel(stub: .skin_type_product_failure)

    //when
    expectation { expectation in
      self.viewModel.fetchProduct(skinType: "취소", page: 1, completion: { response in

        //then
        XCTAssertNotNil(response.error)
        XCTAssertEqual(response.result, .failure)
        expectation.fulfill()
      })
    }
  }

  func testViewModel_whenSearch_isResponseValidation() {

    //given
    setupViewModel(stub: .search_product)

    //when
    expectation { expectation in
      self.viewModel.searchProduct(skinType: "oliy", keyword: "아모레") { response in
        guard let data = response.json as? ProductsModel else {
          XCTFail("response data nil")
          return
        }

        //then
        XCTAssertNil(response.error)
        XCTAssertEqual(response.result, .success)
        XCTAssertEqual(data.statusCode, 200)
        XCTAssertFalse(data.body.isEmpty)
        expectation.fulfill()
      }
    }
  }

  func testViewModel_whenLoadMore_isResponseValidation() {

    //given
    let indexPath = IndexPath(item: 19, section: 0)

    //when
    expectation { expectation in
        self.viewModel.loadMore(at: indexPath) { response in
          
          //then
          XCTAssertEqual(response.result, .success)
          expectation.fulfill()
        }
      }
    
  }
  
  func testViewModel_whenProductsRemove_isEmpty() {
    //when
    viewModel.removeAllProducts()
    
    //then
    XCTAssertEqual(viewModel.products.count, 0)
  }
  
  func testViewModel_NumberOfSection() {
    XCTAssertEqual(viewModel.numberOfSections(), 1)
  }
  
  func testViewModel_NumberOfItemsSection() {
    XCTAssertEqual(viewModel.numberOfItemsSection(), viewModel.products.count)
  }
}
