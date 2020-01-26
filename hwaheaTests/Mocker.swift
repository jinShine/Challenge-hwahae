//
//  Mocker.swift
//  hwaheaTests
//
//  Created by seungjin on 2020/01/26.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import XCTest
@testable import hwahea

class Mocker: NetworkServiceStub {
  
  static func product(stub: StubType, to router: hwaheaRouter, completion: @escaping ((Product) -> Void) ) {
    let mocker = Mocker(stub: stub)
    switch router {
    case .productList:
      mocker.request(to: router, decoder: ProductsModel.self) { response in
        guard let data = response.json as? ProductsModel,
          let product = data.body.first else { return }
        completion(product)
      }
    case .productDetail:
      mocker.request(to: router, decoder: ProductDetailModel.self) { response in
        guard let data = response.json as? ProductDetailModel else { return }
        completion(data.body)
      }
    default: return
    }
  }
}
