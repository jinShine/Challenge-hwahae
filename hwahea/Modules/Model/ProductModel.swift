//
//  ProductModel.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

struct ProductList: Decodable {
  var statusCode: Int
  var body: [Product]
}

struct Product: Decodable {
  var id: Int
  var price: String
  var title: String
  var thumbnailImage: String
  var oilyScore: Int?
  var sensitiveScore: Int?
  var dryScore: Int?

  enum CodingKeys: String, CodingKey {
    case id, price, title
    case thumbnailImage = "thumbnail_image"
    case oilyScore = "oily_score"
    case sensitiveScore = "sensitive_score"
    case dryScore = "dry_score"
  }

}
