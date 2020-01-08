//
//  UIView+Additions.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

extension UIView {
  
  static var reuseIdentifier: String {
    let nameSpaceClassName = NSStringFromClass(self)
    guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
      return nameSpaceClassName
    }
    
    return className
  }
}
