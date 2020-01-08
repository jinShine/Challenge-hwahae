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
  let repository: AppRepository
  
  private init() {
    self.navigator = Navigator()
    self.repository = AppRepository()
  }
  
  func setupInitialScreen() {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = navigator.navigate(to: .productList)
    window.backgroundColor = .white
    window.makeKeyAndVisible()
    self.window = window
  }
  
}

extension Application {
  static let shared = Application()
}
