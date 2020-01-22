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
    return priceFormatter(for: product.price)
  }

  private func priceFormatter(for price: String) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.locale = Locale.current
    formatter.maximumFractionDigits = 0
    if let price = Double(price),
      let result = formatter.string(from: NSNumber(value: price)) {
      return result + "원"
    }

    return ""
  }
}
