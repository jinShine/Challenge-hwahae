//
//  ProductListViewController.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

protocol ProductListViewProtocol {
  func setupUI()
  func setupConstraints()
  func bind()
  func reload()
}

class ProductListViewController: BaseViewController, ProductListViewProtocol {

  //MARK:- Constant

  struct UI {
    static let maxTitleHeight: CGFloat = 42
    static let maxSellerHeight: CGFloat = 20
    static let titleTopMargin: CGFloat = 4
    
    struct SearchContainer {
      static let height: CGFloat = UIDevice.current.hasNotch ? 48 : 68
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
    searchBar.delegate = self
    searchBar.placeholder = "검색"
    searchBar.isTranslucent = false
    searchBar.backgroundImage = UIImage()
    if #available(iOS 13.0, *) {
      searchBar.searchTextField.backgroundColor = .white
      searchBar.searchTextField.font = Application.font.appleSDGothicNeoRegular(size: 17)
    } else {
      if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
        textfield.backgroundColor = .white
        textfield.font = Application.font.appleSDGothicNeoRegular(size: 17)
      }
    }
    searchBar.layer.cornerRadius = UI.SearchBar.cornerRadius
    searchBar.layer.masksToBounds = true
    searchBar.layer.applyShadow(color: UI.SearchBar.layerColor, alpha: 0, x: 0, y: 2, blur: 4, spread: 0)
    return searchBar
  }()
  
  let categoryHeaderView = CategoryHeaderView()
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.footerReferenceSize = CGSize(width: view.frame.width, height: UI.CollectionView.footerHeight)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.keyboardDismissMode = .interactive

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

  private var previousContentOffsetY: CGFloat = 0.0
  var viewModel: ProductListViewModelProtocol
  var navigator: Navigator


  //MARK:- Initialize

  init(viewModel: ProductListViewModelProtocol, navigator: Navigator) {
    self.viewModel = viewModel
    self.navigator = navigator

    super.init()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK:- Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  //MARK:- Methods

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  override func setupUI() {
    super.setupUI()

    navigationController?.isNavigationBarHidden = true
    self.setStatusBarViewBackground(Application.color.main)
    [categoryHeaderView, searchContainer, collectionView].forEach { view.addSubview($0) }
    [searchBar].forEach { searchContainer.addSubview($0) }
  }

  override func setupConstraints() {
    super.setupConstraints()

    searchContainer.snp.makeConstraints {
      let window = UIApplication.shared.windows.first { $0.isKeyWindow }
      if #available(iOS 13.0, *) {
        $0.top.equalToSuperview().offset(window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0)
      } else {
        $0.top.equalToSuperview().offset(UIApplication.shared.statusBarFrame.height)
      }
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(UI.SearchContainer.height)
    }

    searchBar.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.leading.equalToSuperview().offset(UI.SearchBar.margin)
      $0.trailing.bottom.equalToSuperview().offset(-UI.SearchBar.margin)
      $0.height.equalTo(UI.SearchBar.height)
    }
    
    categoryHeaderView.snp.makeConstraints {
      $0.top.equalTo(searchContainer.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(UI.CategoryHeaderView.height)
    }

    collectionView.snp.makeConstraints {
      $0.top.equalTo(categoryHeaderView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }

  override func bind() {
    super.bind()

    update()
    didTapSkinType()
  }

  func reload() {
    self.refreshFooterView?.startRefreshing()
    DispatchQueue.main.async { [weak self] in
      self?.collectionView.reloadData()
    }
  }

  func openDetail(at indexPath: IndexPath) {
    let id = viewModel.products[indexPath.row].id
    navigator.show(scene: .productDetail(id: id), sender: self, animated: true)
  }

  private func update(with type: SkinType = SkinType.oily) {
    self.spinnerView.startAnimating()
    self.viewModel.removeAllProducts()

    viewModel.updateProduct(skinType: SkinType.transform(to: type), page: viewModel.page, completion: { [weak self] response in
      self?.spinnerView.stopAnimating()

      guard response.result == .success else {
        self?.showAlert(title: "에러", message: response.error?.message)
        return
      }

      DLog(response)
      self?.reload()
    })
  }

  private func didTapSkinType() {
    categoryHeaderView.skinTypeDidChange = { [weak self] _ in
      guard let self = self else { return }

      self.showAlert(title: "필터", message: "피부 타입", options: [[
        SkinType.oily.rawValue : UIAlertAction.Style.default,
        SkinType.dry.rawValue : UIAlertAction.Style.default,
        SkinType.sensitive.rawValue : UIAlertAction.Style.default,
        "취소" : UIAlertAction.Style.cancel,
        ]], preferredStyle: .actionSheet, handler: { action in
          guard let title = action.title, title != "취소",
          let type = SkinType(rawValue: title) else { return }
          self.viewModel.currentSkinType = type
          self.update(with: self.viewModel.currentSkinType)
      })
    }
  }

  private func search(with type: SkinType = SkinType.oily, keyword: String) {
    self.spinnerView.startAnimating()

    viewModel.searchProduct(skinType: SkinType.transform(to: type), keyword: keyword) { [weak self] response in
      self?.spinnerView.stopAnimating()
      self?.dismissKeyboard()
      guard response.result == .success else {
        self?.showAlert(title: "에러", message: response.error?.message)
        return
      }
      DLog(response)
      self?.reload()
    }
  }

  private func dismissKeyboard() {
    view.endEditing(true)
  }

}

//MARK:- ScrollView delegate

extension ProductListViewController: UIScrollViewDelegate {

  private func updateHeaderAnimation(by scrollView: UIScrollView) {
    guard previousContentOffsetY >= 0 else {
      previousContentOffsetY = 0.0
      return
    }

    if previousContentOffsetY >= scrollView.contentOffset.y {
      categoryHeaderView.alpha = 1
      categoryHeaderView.snp.updateConstraints {
        $0.top.equalTo(searchContainer.snp.bottom)
      }
      UIView.animate(withDuration: 0.35) {
        self.view.layoutIfNeeded()
      }
    } else {
      categoryHeaderView.alpha = 0
      categoryHeaderView.snp.updateConstraints {
        $0.top.equalTo(searchContainer.snp.bottom).offset(-UI.CategoryHeaderView.height)
      }
      UIView.animate(withDuration: 0.35) {
        self.view.layoutIfNeeded()
      }
    }
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeaderAnimation(by: scrollView)
  }

  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    previousContentOffsetY = scrollView.contentOffset.y
  }
}

//MARK:- Search delegate

extension ProductListViewController: UISearchBarDelegate {

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    search(with: viewModel.currentSkinType, keyword: searchBar.text ?? "")
    dismissKeyboard()
  }
}
