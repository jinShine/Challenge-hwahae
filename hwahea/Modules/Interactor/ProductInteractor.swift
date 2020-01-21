//
//  ProductListInteractor.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

protocol ProductListProtocol {

  func fetchList(skinType: String,
                 page: Int,
                 completion: @escaping ((NetworkDataResponse) -> Void))

  func fetchDetail(id: Int,
                 completion: @escaping ((NetworkDataResponse) -> Void))

  func search(skinType: String,
              keyword: String,
              completion: @escaping ((NetworkDataResponse) -> Void))
}

class ProductInteractor: ProductListProtocol {

  let service: NetworkService

  init(service: NetworkService) {
    self.service = service
  }

  func fetchList(skinType: String,
                 page: Int,
                 completion: @escaping ((NetworkDataResponse) -> Void)) {

    service.request(to: .productList(skinType: skinType, page: page),
                    decoder: ProductsModel.self,
                    completion: completion)
  }

  func fetchDetail(id: Int, completion: @escaping ((NetworkDataResponse) -> Void)) {

    service.request(to: .productDetail(id: id),
                    decoder: ProductDetailModel.self,
                    completion: completion)
  }

  func search(skinType: String, keyword: String, completion: @escaping ((NetworkDataResponse) -> Void)) {

    service.request(to: .productSearch(skinType: skinType,keyword: keyword),
                    decoder: ProductsModel.self,
                    completion: completion)
  }

}
