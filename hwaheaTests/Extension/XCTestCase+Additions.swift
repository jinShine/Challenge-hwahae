//
//  XCTestCase+Additions.swift
//  hwaheaTests
//
//  Created by seungjin on 2020/01/25.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
  
  func expectation(_ handler: @escaping (XCTestExpectation) -> Void) {
    let expectation = XCTestExpectation(description: "com.jinnify.hwahea.expectation")
    handler(expectation)
    wait(for: [expectation], timeout: 10)
  }
}
