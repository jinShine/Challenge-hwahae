//
//  ProductListViewModel.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

protocol ProductListViewModelProtocol {

  var products: [Product] { get set }
  var currentSkinType: SkinType { get set }
  var page: Int { get }

  func updateProduct(skinType: String, page: Int, completion: @escaping ((NetworkDataResponse) -> Void))
  func searchProduct(skinType: String, keyword: String, completion: @escaping ((NetworkDataResponse) -> Void))
  func loadMore(at indexPath: IndexPath, completion: @escaping (NetworkDataResponse) -> Void)
  func removeAllProducts()
  func numberOfSections() -> Int
  func numberOfItemsSection() -> Int
}

class ProductListViewModel: BaseViewModel, ProductListViewModelProtocol {

  //MARK:- Cell Type

  enum CellType: Int {
    case product
  }


  //MARK:- Properties

  let productInteractor: ProductInteractor
  var products: [Product] = []
  var currentSkinType: SkinType = .oily
  var page: Int = 1

  //MARK:- Init

  init(productInteractor: ProductInteractor) {
    self.productInteractor = productInteractor
  }

  //MARK:- Methods

  func updateProduct(skinType: String = "oliy",
                     page: Int = 1,
                     completion: @escaping ((NetworkDataResponse) -> Void)) {

    self.productInteractor.fetchList(skinType: skinType, page: page) { [weak self] response in
      guard let product = response.json as? ProductsModel else {
        completion(response)
        return
      }

      product.body.forEach { self?.products.append($0) }
      completion(response)
    }
  }

  func searchProduct(skinType: String = "oliy",
                     keyword: String,
                     completion: @escaping ((NetworkDataResponse) -> Void)) {

    self.productInteractor.search(skinType: skinType, keyword: keyword) { [weak self] response in
      guard let product = response.json as? ProductsModel else {
        completion(response)
        return
      }

      self?.removeAllProducts()
      product.body.forEach { self?.products.append($0) }
      completion(response)
    }
  }

  func loadMore(at indexPath: IndexPath,
                completion: @escaping (NetworkDataResponse) -> Void) {

    if indexPath.item == products.count - 1 {
      page += 1
      updateProduct(skinType: SkinType.transform(to: currentSkinType),
                    page: page,
                    completion: completion)
    }
  }

  func removeAllProducts() {
    products.removeAll(keepingCapacity: true)
  }

  //MARK:- data source

  func numberOfSections() -> Int {
    return 1
  }

  func numberOfItemsSection() -> Int {
    return products.count
  }

}
