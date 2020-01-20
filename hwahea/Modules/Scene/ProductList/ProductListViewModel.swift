//
//  ProductListViewModel.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ProductListViewModel: BaseViewModel {

  //MARK:- Cell Type

  enum CellType: Int {
    case product
  }


  //MARK:- Properties

  let productInteractor: ProductInteractor
  var products: [Product] = []
  var skinType: SkinType = .oily
  var page: Int = 1

  //MARK:- Init

  init(productListInteractor: ProductInteractor) {
    self.productInteractor = productListInteractor
  }

  //MARK:- Methods

  func updateProduct(skinType: String = "oliy",
                     page: Int = 1,
                     completion: @escaping ((NetworkDataResponse) -> Void)) {
    self.productInteractor.fetchProduct(skinType: skinType, page: page) { [weak self] response in
      guard let product = response.json as? ProductList else {
        completion(response)
        return
      }
      self?.products.removeAll(keepingCapacity: true)
      product.body.forEach { self?.products.append($0) }
      completion(response)
    }
  }

  func searchProduct(skinType: String = "oliy",
                     keyword: String,
                     completion: @escaping ((NetworkDataResponse) -> Void)) {
    self.productInteractor.searchProduct(skinType: skinType, keyword: keyword) { [weak self] response in
      guard let product = response.json as? ProductList else {
        completion(response)
        return
      }
      self?.products.removeAll(keepingCapacity: true)
      product.body.forEach { self?.products.append($0) }
      completion(response)
    }
  }

  //MARK:- data source

  func numberOfSections() -> Int {
    return 1
  }

  func numberOfItemsSection() -> Int {
    return products.count
  }

}
