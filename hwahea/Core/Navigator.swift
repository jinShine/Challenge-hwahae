//
//  Navigator.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

protocol Navigatable {
  var navigator: Navigator? { get set }
}

class Navigator {
  
  enum Scene {
    case productList
    case productDetail
  }

  func navigate(to scene: Scene) -> UIViewController {
    switch scene {
    case .productList:
      let viewModel = ProductListViewModel()
      let viewController = ProductListViewController(viewModel: viewModel, navigator: self)
      return viewController
    case .productDetail:
      return UIViewController()
    }
  }
}

//MARK:- Transition
extension Navigator {

  func pop(sender: UIViewController?, toRoot: Bool = false, animated: Bool) {
    if toRoot {
      sender?.navigationController?.popToRootViewController(animated: animated)
    } else {
      sender?.navigationController?.popViewController(animated: animated)
    }
  }

  func dismiss(sender: UIViewController,
               animated: Bool,
               completion: (() -> Void)? = nil) {
    sender.dismiss(animated: animated, completion: completion)
  }

  func show(scene: Scene,
            sender: UIViewController?,
            animated: Bool,
            completion: (() -> Void)? = nil) {
    sender?.present(navigate(to: scene), animated: true, completion: completion)
  }

  func push(scene: Scene,
            sender: UINavigationController?,
            animated: Bool) {
    sender?.pushViewController(navigate(to: scene), animated: animated)
  }

}
