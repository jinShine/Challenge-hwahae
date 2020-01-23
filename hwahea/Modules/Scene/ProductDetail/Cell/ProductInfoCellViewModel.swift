//
//  ProductInfoCellViewModel.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

class ProductInfoCellViewModel {

  private var product: Product

  init(product: Product) {
    self.product = product
  }

  var title: String {
    return product.title
  }

  var price: String {
    return product.price.decimalFormatter + "원"
  }
}
