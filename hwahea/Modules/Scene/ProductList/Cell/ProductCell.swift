//
//  ProductCell.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

final class ProductCell: BaseCollectionViewCell {
  
  //MARK:- Constant
  
  struct UI {
    static let productImageRadius: CGFloat = 14
    static let productBorderColor: CGColor = UIColor(r: 24, g: 24, b: 80, a: 0.04).cgColor
    static let titleTopMargin: CGFloat = 4
    static let titleLeftMargin: CGFloat = 8
    static let titleRightMargin: CGFloat = -8
    static let sellerHeight: CGFloat = 20
  }
  
  //MARK:- UI Properties
  
  let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = UI.productImageRadius
    imageView.layer.borderColor = UI.productBorderColor
    imageView.layer.borderWidth = 1
    imageView.backgroundColor = .brown
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.font = Application.font.notoSansBlack(size: 14)
    label.textColor = Application.color.dark
    return label
  }()
  
  let sellerLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = Application.font.notoSansBold(size: 14)
    label.textColor = Application.color.blueGrey
    return label
  }()
  
  
  //MARK:- Properties

  var viewModel: ProductCellViewModel

//  var viewModel: ProductCellViewModel! {
//    didSet {
//      let imageURL = URL(string: viewModel.productImage)
//      productImageView.kf.setImage(with: imageURL)
//      titleLabel.text = viewModel.title
//      sellerLabel.text = viewModel.seller
//    }
//  }
  
  
  //MARK:- Life Cycle

  init(viewModel: ProductCellViewModel) {
    self.viewModel = viewModel

    super.init(frame: .zero)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK:- Methods
  
  override func setupUI() {
    [productImageView, titleLabel, sellerLabel].forEach {
      contentView.addSubview($0)
    }
  }
  
  override func setupConstraints() {
    
    productImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(productImageView.snp.width)
    }

    titleLabel.snp.makeConstraints {
      $0.top.equalTo(productImageView.snp.bottom).offset(UI.titleTopMargin)
      $0.leading.equalTo(productImageView).offset(UI.titleLeftMargin)
      $0.trailing.equalTo(productImageView).offset(UI.titleRightMargin)
      $0.height.greaterThanOrEqualTo(UI.sellerHeight)
    }
    
    sellerLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom)
      $0.leading.equalTo(titleLabel)
      $0.trailing.equalTo(titleLabel)
      $0.bottom.lessThanOrEqualToSuperview()
      $0.height.equalTo(UI.sellerHeight)
    }

  }
  
}
