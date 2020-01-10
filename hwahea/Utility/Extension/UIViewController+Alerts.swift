//
//  UIViewController+Alerts.swift
//  hwahea
//
//  Created by Seungjin on 10/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

extension UIViewController {

  func showAlert(title: String?,
                 message: String?,
                 options: [[String : UIAlertAction.Style]],
                 preferredStyle: UIAlertController.Style,
                 handler: ((UIAlertAction) -> Void)?) {

    let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

    for option in options {
        for (title, style) in option {
            let alertAction = UIAlertAction(title: title, style: style, handler: handler)
            alertController.addAction(alertAction)
        }
    }

    self.present(alertController, animated: true)
  }
}
