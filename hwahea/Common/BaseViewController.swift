//
//  BaseViewController.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, Navigatable {
  
  //MARK:- Constant
  
  struct UI {
    
  }
  
  //MARK:- Properties
  
  var viewModel: BaseViewModel?
  var navigator: Navigator?
  
  //MARK:- Initialize
  
  init(viewModel: BaseViewModel, navigator: Navigator) {
    self.viewModel = viewModel
    self.navigator = navigator
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
  
}
