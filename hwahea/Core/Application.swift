//
//  Application.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class Application {
  
  var window: UIWindow?
  var navigator: Navigator
  let service: NetworkService
  
  private init() {
    self.navigator = Navigator()
    self.service = NetworkService()
  }
  
  func setupInitialScreen() {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = BaseNavigationController(
      rootViewController: navigator.navigate(to: .productList)
    )
    window.backgroundColor = .white
    window.makeKeyAndVisible()
    self.window = window
  }
  
}

extension Application {
  static let shared = Application()
}
