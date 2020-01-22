//
//  ProductImageCell.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ProductImageCell: BaseTableViewCell {

  //MARK:- Constant

  struct UI {
    static let contentCornerRadius: CGFloat = 30
  }

  //MARK:- UI Properties

  let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()


  //MARK:- Properties

  var viewModel: ProductImageCellViewModel? {
    didSet {
      configureView()
    }
  }


  //MARK:- Life Cycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  //MARK:- Methods

  override func setupUI() {
    contentView.addSubview(productImageView)
    backgroundColor = .black
  }

  override func setupConstraints() {
    productImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  private func configureView() {
    guard let viewModel = viewModel else { return }
    productImageView.kf.setImage(with: viewModel.productImageURL)
  }
}
