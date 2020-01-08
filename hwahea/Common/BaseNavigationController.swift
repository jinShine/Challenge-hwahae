//
//  BaseNavigationController.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
  
  //MARK:- Constant
  
  struct UI {
    
  }
  
  //MARK:- Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  //MARK:- Methods
  
  private func setupUI() {
    navigationBar.shadowImage = UIImage()
    navigationBar.isTranslucent = false
  }
}
