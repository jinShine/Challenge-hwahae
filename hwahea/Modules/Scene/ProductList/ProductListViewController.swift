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
    static let maxTitleHeight: CGFloat = 42
    static let maxSellerHeight: CGFloat = 20
    static let titleTopMargin: CGFloat = 4
    
    struct SearchContainer {
      static let height: CGFloat = 48
    }
    
    struct SearchBar {
      static let margin: CGFloat = 12
      static let cornerRadius: CGFloat = 10
      static let layerColor: UIColor = UIColor(red:0.09, green:0.09, blue:0.31, alpha:0.12)
      static let height: CGFloat = 36
    }
    
    struct CategoryHeaderView {
      static let height: CGFloat = 50
      static let borderColor: CGColor = UIColor(r: 33, g: 47, b: 62, a: 0.1).cgColor
      static let margin: CGFloat = 12
    }
    
    struct CollectionView {
      static let inset: UIEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      static let column: CGFloat = 2
      static let itemSpacing: CGFloat = 7
      static let lineSpacing: CGFloat = 24
      static let footerHeight: CGFloat = 30
    }
  }

  //MARK:- UI Properties
  var refreshFooterView: RefreshFooterView?
  
  let searchContainer: UIView = {
    let view = UIView()
    view.backgroundColor = Application.color.main
    return view
  }()

  lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "검색"
    searchBar.isTranslucent = false
    searchBar.backgroundImage = UIImage()
    searchBar.searchTextField.backgroundColor = .white
    searchBar.layer.cornerRadius = UI.SearchBar.cornerRadius
    searchBar.layer.masksToBounds = true
    searchBar.searchTextField.font = Application.font.appleSDGothicNeoRegular(size: 17)
    searchBar.layer.applyShadow(color: UI.SearchBar.layerColor, alpha: 0, x: 0, y: 2, blur: 4, spread: 0)
    return searchBar
  }()
  
  let categoryHeaderView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.borderColor = UI.CategoryHeaderView.borderColor
    view.layer.borderWidth = 1
    return view
  }()
  
  let categoryButton: UIButton = {
    let button = UIButton()
    button.setTitle("모든 피부 타입", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setImage(UIImage(named: "arrowDown"), for: .normal)
    button.semanticContentAttribute = .forceRightToLeft
    button.titleLabel?.font = Application.font.appleSDGothicNeoBold(size: 14)
    return button
  }()
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.footerReferenceSize = CGSize(width: view.frame.width, height: UI.CollectionView.footerHeight)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self

    collectionView.register(
      ProductCell.self,
      forCellWithReuseIdentifier: ProductCell.reuseIdentifier
    )
    collectionView.register(
      RefreshFooterView.classForCoder(),
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
      withReuseIdentifier: RefreshFooterView.reuseIdentifier
    )
    
    return collectionView
  }()

  //MARK:- Properties
  var previousContentOffset: CGFloat = 0.0

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
    [searchContainer, categoryHeaderView, collectionView].forEach { view.addSubview($0) }
    [searchBar].forEach { searchContainer.addSubview($0) }
    [categoryButton].forEach { categoryHeaderView.addSubview($0) }
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
      $0.height.equalTo(UI.SearchBar.height)
    }
    
    categoryHeaderView.snp.makeConstraints {
      $0.top.equalTo(searchContainer.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(UI.CategoryHeaderView.height)
    }
    
    categoryButton.snp.makeConstraints {
      $0.leading.greaterThanOrEqualToSuperview()
      $0.trailing.equalToSuperview().offset(-UI.CategoryHeaderView.margin)
      $0.centerY.equalToSuperview()
    }
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(categoryHeaderView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }

  override func bind() {

  }

}

extension ProductListViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    print(scrollView)
    let currentOffset = scrollView.contentOffset.y - previousContentOffset
    if currentOffset > previousContentOffset {
      categoryHeaderView.snp.updateConstraints {
        $0.height.equalTo(50)
      }
      
    } else if currentOffset < previousContentOffset {
        categoryHeaderView.snp.updateConstraints {
          $0.height.equalTo(0)
        }
    }
    previousContentOffset = scrollView.contentOffset.y
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    previousContentOffset = scrollView.contentOffset.y
  }
}
