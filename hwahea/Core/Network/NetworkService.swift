//
//  NetworkService.swift
//  hwahea
//
//  Created by Seungjin on 10/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation
import Moya
import Alamofire

protocol NetworkServiceType {

  func request<T: Decodable>(to router: hwaheaRouter,
                             decoder: T.Type,
                             completion: @escaping (NetworkDataResponse) -> Void)
}

struct NetworkService: NetworkServiceType {

  static private let sharedManager: Alamofire.SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
    configuration.timeoutIntervalForRequest = 30
    configuration.timeoutIntervalForResource = 30
    configuration.requestCachePolicy = NSURLRequest.CachePolicy.useProtocolCachePolicy
    return Alamofire.SessionManager(configuration: configuration)
  }()

  private let provider: MoyaProvider<hwaheaRouter> = {
    let provider = MoyaProvider<hwaheaRouter>(endpointClosure: MoyaProvider.defaultEndpointMapping,
                                              requestClosure: MoyaProvider<hwaheaRouter>.defaultRequestMapping,
                                              stubClosure: MoyaProvider.neverStub,
                                              callbackQueue: nil,
                                              manager: sharedManager,
                                              plugins: [],
                                              trackInflights: false)
    return provider
  }()

  func request<T: Decodable>(to router: hwaheaRouter,
                             decoder: T.Type,
                             completion: @escaping (NetworkDataResponse) -> Void) {

    provider.request(router) { response in
      switch response {
      case .success(let result):
        do {
          let model = try result.data.decode(decoder)
          completion(NetworkDataResponse(json: model, result: .success, error: nil))
        } catch {
          let errorJsonData = response.value?.data
          completion(NetworkError.transform(jsonData: errorJsonData))
        }
      case .failure:
        let errorJsonData = response.value?.data
        completion(NetworkError.transform(jsonData: errorJsonData))
      }
    }
  }
}
