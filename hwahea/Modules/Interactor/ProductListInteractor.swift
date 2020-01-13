//
//  ProductListInteractor.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

protocol ProductListType {

  func fetchProduct(skinType: String,
                    page: Int,
                    completion: @escaping ((NetworkDataResponse) -> Void))
}

class ProductListInteractor: ProductListType {

  let service: NetworkService

  init(service: NetworkService) {
    self.service = service
  }

  func fetchProduct(skinType: String,
                    page: Int,
                    completion: @escaping ((NetworkDataResponse) -> Void)) {

    service.request(to: .productList(skinType: skinType, page: page),
                    decoder: ProductList.self,
                    completion: completion)
  }

}
