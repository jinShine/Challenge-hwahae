//
//  NetworkDataResponse.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

enum NetworkResult {
  case success,
  failure
}

struct NetworkDataResponse {
  let json: Decodable?
  let result: NetworkResult
  let error: NetworkError?
}
