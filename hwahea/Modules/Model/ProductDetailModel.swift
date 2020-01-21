//
//  ProductDetailModel.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

struct ProductDetailModel: Decodable {
  var statusCode: Int
  var body: Product
}
