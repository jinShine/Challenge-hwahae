//
//  ProductDetailViewModel.swift
//  hwahea
//
//  Created by Seungjin on 08/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

protocol ProductDetailViewModelProtocol {

  func fetchProduct(id: Int, completion: @escaping (NetworkDataResponse) -> Void)
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
    productInteractor.fetchDetail(id: id) { response in
      print(response)
    }
  }
}
