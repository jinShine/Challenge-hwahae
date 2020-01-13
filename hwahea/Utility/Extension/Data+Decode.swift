//
//  Data+Decode.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

extension Data {

  func decode<T>(_ type: T.Type, decoder: JSONDecoder? = nil) throws -> T where T: Decodable {
    let decoder = decoder ?? JSONDecoder()
    return try decoder.decode(type, from: self)
  }
}
