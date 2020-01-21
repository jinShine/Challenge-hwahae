//
//  ProductModel.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

struct ProductsModel: Decodable {
  var statusCode: Int
  var body: [Product]
}
