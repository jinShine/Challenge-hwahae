//
//  Navigator.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

enum Scene {
  case productList
  case productDetail(id: Int)
}

class Navigator {

  func navigate(to scene: Scene) -> UIViewController {

    let service = Application.shared.service

    switch scene {
    case .productList:
      let viewModel = ProductListViewModel(productInteractor: ProductInteractor(service: service))
      let viewController = ProductListViewController(viewModel: viewModel, navigator: self)
      return viewController
    case .productDetail(let id):
      let viewModel = ProductDetailViewModel(productInteractor: ProductInteractor(service: service))
      let viewController = ProductDetailViewController(viewModel: viewModel, id: id)
      return viewController
    }
  }
}

//MARK:- Transition
extension Navigator: Transitionable {

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
