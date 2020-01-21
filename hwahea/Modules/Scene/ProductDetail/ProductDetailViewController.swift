//
//  ProductDetailViewController.swift
//  hwahea
//
//  Created by Seungjin on 08/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

protocol ProductDetailViewProtocol {
  func setupUI()
  func setupConstraints()
  func bind()
}

class ProductDetailViewController: BaseViewController, ProductDetailViewProtocol {

  //MARK:- Constant

  struct UI {
    struct DismissButton {
      static let size: CGFloat = 40
      static let margin: CGFloat = 16
    }
    struct TableView {
      static let estimateRowHeight: CGFloat = 100
    }
    struct PurchaseButton {
      static let cornerRadius: CGFloat = 14
      static let bottomMargin: CGFloat = -30
      static let leadingMargin: CGFloat = 24
      static let trailingMargin: CGFloat = -24
      static let height: CGFloat = 52
    }
  }

  //MARK:- UI Properties

  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "dismiss"), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
//    button.backgroundColor = Application.color.darkAlpha
    button.layer.cornerRadius = UI.DismissButton.size / 2
    button.layer.masksToBounds = true
//    button.addTarget(self, action: #selector(didTapDismissAction), for: .touchUpInside)
    return button
  }()

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .black
    tableView.estimatedRowHeight = UI.TableView.estimateRowHeight
    tableView.rowHeight = UITableView.automaticDimension
    tableView.contentInset = UIEdgeInsets(top: UIApplication.shared.statusBarFrame.height, left: 0, bottom: 0, right: 0)
    tableView.separatorStyle = .none
    tableView.allowsSelection = false
    tableView.showsVerticalScrollIndicator = false
    tableView.delegate = self
    tableView.dataSource = self

    tableView.register(ProductImageCell.classForCoder(),
                       forCellReuseIdentifier: ProductImageCell.reuseIdentifier)
    tableView.register(ProductInfoCell.classForCoder(),
                       forCellReuseIdentifier: ProductInfoCell.reuseIdentifier)
    tableView.register(ProductDescriptionCell.classForCoder(),
                       forCellReuseIdentifier: ProductDescriptionCell.reuseIdentifier)
    tableView.register(NoticeCell.classForCoder(),
                       forCellReuseIdentifier: NoticeCell.reuseIdentifier)

    return tableView
  }()

  let purchaseButton: UIButton = {
    let button = UIButton()
    button.setTitle("구매하기", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = Application.font.notoSansBlack(size: 18)
    button.titleLabel?.textAlignment = .center
//    button.backgroundColor = Application.color.coralPink
    button.layer.cornerRadius = UI.PurchaseButton.cornerRadius
    button.layer.masksToBounds = true
    return button
  }()

  //MARK:- Properties

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  let viewModel: ProductDetailViewModelProtocol
  let id: Int


  //MARK:- Init

  init(viewModel: ProductDetailViewModelProtocol, id: Int) {
    self.viewModel = viewModel
    self.id = id

    super.init()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK:- Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    print("ddddd", id)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    setStatusBarViewBackground(.clear)
  }


  //MARK:- Methods

  override func setupUI() {
    super.setupUI()

    view.backgroundColor = .black
    [tableView, dismissButton, purchaseButton].forEach { view.addSubview($0) }
  }

  override func setupConstraints() {
    super.setupConstraints()

    dismissButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UIApplication.shared.statusBarFrame.height + UI.DismissButton.margin)
      $0.trailing.equalToSuperview().offset(-UI.DismissButton.margin)
      $0.size.equalTo(UI.DismissButton.size)
    }

    tableView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(-UIApplication.shared.statusBarFrame.height)
      $0.bottom.equalToSuperview().offset(UIApplication.shared.statusBarFrame.height)
      $0.leading.trailing.equalToSuperview()
    }

    purchaseButton.snp.makeConstraints {
      $0.bottom.equalToSuperview().offset(UI.PurchaseButton.height)
      $0.leading.equalToSuperview().offset(UI.PurchaseButton.leadingMargin)
      $0.trailing.equalToSuperview().offset(UI.PurchaseButton.trailingMargin)
      $0.height.equalTo(UI.PurchaseButton.height)
    }
  }

  override func bind() {
    super.bind()

    viewModel.fetchProduct(id: id) { response in
      
    }
  }

}
