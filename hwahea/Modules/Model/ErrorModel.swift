//
//  ErrorModel.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

struct IdusErrorModel: Decodable {
  var statusCode: Int
  var body: String
}
