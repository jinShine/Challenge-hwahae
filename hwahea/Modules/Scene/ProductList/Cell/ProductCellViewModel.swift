//
//  ProductCellViewModel.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ProductCellViewModel {

  private var product: Product

  var productImageURL: URL? {
    return URL(string: product.thumbnailImage)
  }

  var titleInfo: String {
    return product.title
  }

  var priceInfo: String {
    return product.price + "원"
  }

  init(product: Product) {
    self.product = product
  }
  
}
