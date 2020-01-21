//
//  ProductListInteractor.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

protocol ProductListProtocol {

  func fetchProduct(skinType: String,
                    page: Int,
                    completion: @escaping ((NetworkDataResponse) -> Void))

  func searchProduct(skinType: String,
                     keyword: String,
                     completion: @escaping ((NetworkDataResponse) -> Void))
}

class ProductInteractor: ProductListProtocol {

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

  func searchProduct(skinType: String, keyword: String, completion: @escaping ((NetworkDataResponse) -> Void)) {

    service.request(to: .productSearch(skinType: skinType,keyword: keyword),
                    decoder: ProductList.self,
                    completion: completion)
  }

}
