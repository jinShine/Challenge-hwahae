//
//  Device+Additions.swift
//  hwahea
//
//  Created by Seungjin on 23/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
