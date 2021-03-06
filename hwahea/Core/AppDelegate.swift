//
//  AppDelegate.swift
//  hwahea
//
//  Created by seungjin on 2020/01/07.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setupRoot()
    
    return true
  }

  private func setupRoot() {
    Application.shared.setupInitialScreen()
    self.window = Application.shared.window
  }
}

