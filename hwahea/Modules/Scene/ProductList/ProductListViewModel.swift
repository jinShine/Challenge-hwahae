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

  let productListInteractor: ProductListInteractor
  var products: [Product] = []
  var page: Int = 1

  //MARK:- Init

  init(productListInteractor: ProductListInteractor) {
    self.productListInteractor = productListInteractor
  }

  //MARK:- Methods

  func updateProduct(skinType: String = "oliy",
                     page: Int = 1,
                     completion: @escaping ((NetworkDataResponse) -> Void)) {
    self.productListInteractor.fetchProduct(skinType: skinType, page: page) { [weak self] response in
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
