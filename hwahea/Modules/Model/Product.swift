//
//  Product.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

struct Product: Decodable {
  var id: Int
  var price: String
  var title: String
  var thumbnailImage: String
  var fullSizeImage: String
  var oilyScore: Int?
  var sensitiveScore: Int?
  var dryScore: Int?
  var description: String

  enum CodingKeys: String, CodingKey {
    case id, price, title, description
    case thumbnailImage = "thumbnail_image"
    case fullSizeImage = "full_size_image"
    case oilyScore = "oily_score"
    case sensitiveScore = "sensitive_score"
    case dryScore = "dry_score"
  }
}
