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
    
  static func product(stub: StubType, completion: @escaping ((ProductsModel) -> Void) ) {
    let mocker = Mocker(stub: stub)
    mocker.request(to: .productList(skinType: "oily", page: 1), decoder: ProductsModel.self) { response in
      guard let data = response.json as? ProductsModel else {
        return
      }
      
      completion(data)
    }
  }
}
