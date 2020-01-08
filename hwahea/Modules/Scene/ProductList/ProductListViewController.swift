//
//  ProductListViewController.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ProductListViewController: BaseViewController {

  //MARK:- Constant

  struct UI {
    struct SearchContainer {
      static let height: CGFloat = 48
//      static let height: CGFloat = 70
    }
    struct SearchBar {
      static let margin: CGFloat = 10
      static let cornerRadius: CGFloat = 10
      static let layerColor: UIColor = UIColor(red:0.09, green:0.09, blue:0.31, alpha:0.12)
    }
  }

  //MARK:- UI Properties
  let searchContainer: UIView = {
    let view = UIView()
    view.backgroundColor = Application.color.main
    return view
  }()

  lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "검색"
    searchBar.isTranslucent = false
    searchBar.layer.cornerRadius = UI.SearchBar.cornerRadius
    searchBar.layer.masksToBounds = true
    searchBar.searchTextField.backgroundColor = .white
    searchBar.searchTextField.font = .systemFont(ofSize: 17)
    searchBar.layer.applyShadow(color: UI.SearchBar.layerColor, alpha: 0, x: 0, y: 2, blur: 4, spread: 0)
    return searchBar
  }()

  //MARK:- Properties


  //MARK:- Init


  //MARK:- Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  //MARK:- Methods

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  override func setupUI() {
    navigationController?.isNavigationBarHidden = true
    self.setStatusBarViewBackground(Application.color.main)
    [searchContainer].forEach { view.addSubview($0) }
    [searchBar].forEach { searchContainer.addSubview($0) }
  }

  override func setupConstraints() {
    searchContainer.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UIApplication.shared.statusBarFrame.height)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(UI.SearchContainer.height)
    }

    searchBar.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalToSuperview().offset(UI.SearchBar.margin)
      $0.trailing.bottom.equalToSuperview().offset(-UI.SearchBar.margin)
    }
  }

  override func bind() {

  }

}
