//
//  BaseViewController.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
  
  //MARK:- Constant
  
  struct UI {
    
  }
  
  //MARK:- Properties
  

  //MARK:- Initialize
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    super.init(nibName: nil, bundle: nil)
  }
  
  //MARK:- Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setupConstraints()
    bind()
  }
  
  deinit {
    DLog(String(describing: self))
  }
  
  //MARK:- Methods
  
  func setupUI() { }
  
  func setupConstraints() { }
  
  func bind() { }

  func setStatusBarViewBackground(_ color: UIColor) {
    if #available(iOS 13.0, *) {
      let app = UIApplication.shared
      let statusBarHeight: CGFloat = app.statusBarFrame.size.height

      let statusbarView = UIView()
      statusbarView.backgroundColor = color
      view.addSubview(statusbarView)

      statusbarView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        statusbarView.heightAnchor.constraint(equalToConstant: statusBarHeight),
        statusbarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        statusbarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        statusbarView.topAnchor.constraint(equalTo: view.topAnchor)
      ])

    } else {
      let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
      statusBar?.backgroundColor = color
    }
  }
  
}
