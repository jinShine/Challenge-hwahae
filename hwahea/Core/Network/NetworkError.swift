//
//  NetworkError.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation

struct NetworkError {

  let statusCode: Int
  let message: String

  static func transform(jsonData: Data?) -> NetworkDataResponse {

    do {
      let result = try JSONDecoder().decode(ErrorModel.self, from: jsonData ?? Data())
      DLog(result)
      return NetworkDataResponse(json: nil,
                                 result: .failure,
                                 error: NetworkError(statusCode: result.statusCode, message: result.body))
    } catch {
      DLog("Decodable Error")
      return NetworkDataResponse(json: nil,
                                 result: .failure,
                                 error: NetworkError(statusCode: 0, message: "Decodable Error"))
    }
  }
}
