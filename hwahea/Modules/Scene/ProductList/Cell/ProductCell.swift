//
//  ProductCell.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit
import Kingfisher

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
  
  let productImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = UI.productImageRadius
    imageView.layer.borderColor = UI.productBorderColor
    imageView.layer.borderWidth = 1
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.font = Application.font.notoSansBlack(size: 14)
    label.textColor = Application.color.dark
    return label
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = Application.font.notoSansBold(size: 14)
    label.textColor = Application.color.blueGrey
    return label
  }()
  
  
  //MARK:- Properties

  var viewModel: ProductCellViewModel? {
    didSet {
      configureView()
    }
  }

  //MARK:- Methods
  
  override func setupUI() {
    [productImage, titleLabel, priceLabel].forEach {
      contentView.addSubview($0)
    }
  }
  
  override func setupConstraints() {
    
    productImage.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(productImage.snp.width)
    }

    titleLabel.snp.makeConstraints {
      $0.top.equalTo(productImage.snp.bottom).offset(UI.titleTopMargin)
      $0.leading.equalTo(productImage).offset(UI.titleLeftMargin)
      $0.trailing.equalTo(productImage).offset(UI.titleRightMargin)
      $0.height.greaterThanOrEqualTo(UI.sellerHeight)
    }
    
    priceLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom)
      $0.leading.equalTo(titleLabel)
      $0.trailing.equalTo(titleLabel)
      $0.bottom.lessThanOrEqualToSuperview()
      $0.height.equalTo(UI.sellerHeight)
    }

  }

  private func configureView() {
    guard let viewModel = viewModel else { return }
    productImage.kf.setImage(with: viewModel.productImageURL)
    titleLabel.text = viewModel.titleInfo
    priceLabel.text = viewModel.priceInfo
  }
  
}
