//
//  Application.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class Application {
  
  let repository = AppRepository()
  
  var window: UIWindow?
  var navigator: Navigator
  
  private init() {
    self.navigator = Navigator()
  }
  
  func setupInitialScreen(in window: UIWindow?) {
    guard let window = window else { return }
    
    window.rootViewController = navigator.navigate(to: .productList)
    window.backgroundColor = .white
    window.makeKeyAndVisible()
    self.window = window
  }
  
}

extension Application {
  static let shared = Application()
}
