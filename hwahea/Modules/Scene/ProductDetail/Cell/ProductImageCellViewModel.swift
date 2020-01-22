//
//  ProductImageCellViewModel.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ProductImageCellViewModel {

  private var product: Product

  init(product: Product) {
    self.product = product
  }

  var productImageURL: URL? {
    return URL(string: product.fullSizeImage ?? "")
  }

}
