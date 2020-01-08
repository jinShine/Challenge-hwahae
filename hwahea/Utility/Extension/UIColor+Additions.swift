//
//  UIColor+Additions.swift
//  hwahea
//
//  Created by Seungjin on 08/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

extension UIColor {

  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat? = nil) {
    self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a ?? 255 / 255)
  }
  
}
