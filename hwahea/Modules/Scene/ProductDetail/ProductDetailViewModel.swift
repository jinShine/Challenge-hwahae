//
//  ProductDetailViewModel.swift
//  hwahea
//
//  Created by Seungjin on 08/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

protocol ProductDetailViewModelProtocol {

  var product: Product? { get set }

  func fetchProduct(id: Int, completion: @escaping (NetworkDataResponse) -> Void)
  func numberOfSections() -> Int
  func numberOfRowsInSection() -> Int
}

class ProductDetailViewModel: BaseViewModel, ProductDetailViewModelProtocol {

  //MARK:- Cell Type

  enum CellType: Int {
    case productImage,
    productInfo,
    productDescription,
    notice,
    totalCount
  }


  //MARK:- Properties

  let productInteractor: ProductInteractor
  var product: Product?

  //MARK:- Init

  init(productInteractor: ProductInteractor) {
    self.productInteractor = productInteractor
  }

  //MARK:- Methods

  func fetchProduct(id: Int, completion: @escaping (NetworkDataResponse) -> Void) {
    productInteractor.fetchProduct(id: id) { response in
      guard let data = response.json as? ProductDetailModel else {
        completion(response)
        return
      }

      self.product = data.body
      completion(response)
    }
  }

  //MARK: - data source

  func numberOfSections() -> Int {
    return 1
  }

  func numberOfRowsInSection() -> Int {
    return CellType.totalCount.rawValue
  }
}
