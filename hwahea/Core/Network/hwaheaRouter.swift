//
//  hwaheaRouter.swift
//  hwahea
//
//  Created by Seungjin on 10/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Moya

enum hwaheaRouter {
  case productList(skinType: String, page: Int)
  case productDetail(id: Int)
  case productSearch(skinType: String, keyword: String)
}

extension hwaheaRouter: TargetType {

  var baseURL: URL {
    return URL(string: "https://6uqljnm1pb.execute-api.ap-northeast-2.amazonaws.com/prod")!
  }

  var path: String {
    switch self {
    case .productList, .productSearch:
      return "/products"
    case .productDetail(let id):
      return "/products/\(id)"
    }
  }

  var method: Method {
    switch self {
    case .productList, .productDetail, .productSearch:
      return .get
    }
  }

  var sampleData: Data {
    return "data".data(using: String.Encoding.utf8)!
  }

  var task: Task {
    switch self {
    case .productList(let skinType, let page):
      return .requestParameters(parameters: [
        "skin_type" : skinType,
        "page" : page
      ], encoding: URLEncoding.queryString)
    case .productDetail:
      return .requestPlain
    case .productSearch(let skinType, let keyword):
      return .requestParameters(parameters: [
        "skin_type" : skinType,
        "search" : keyword
      ], encoding: URLEncoding.queryString)
    }
  }

  var headers: [String : String]? {
    return [
      "Content-Type" : "application/json",
      "token" : "7a43448128eafa0f094e33e421a3158a"
    ]
  }

}
