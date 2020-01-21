//
//  Transitioning.swift
//  hwahea
//
//  Created by Seungjin on 09/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

protocol Transitionable {

  func pop(sender: UIViewController?, toRoot: Bool, animated: Bool)

  func dismiss(sender: UIViewController, animated: Bool, completion: (() -> Void)?)

  func show(scene: Scene, sender: UIViewController?, animated: Bool, completion: (() -> Void)?)

  func push(scene: Scene, sender: UINavigationController?, animated: Bool)
}
