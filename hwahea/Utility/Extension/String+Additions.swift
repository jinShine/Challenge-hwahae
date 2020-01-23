//
//  String+Additions.swift
//  hwahea
//
//  Created by Seungjin on 23/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

extension String {

  var decimalFormatter: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.locale = Locale.current
    formatter.maximumFractionDigits = 0
    if let price = Double(self),
      let result = formatter.string(from: NSNumber(value: price)) {
      return result
    }
    return ""
  }

}
