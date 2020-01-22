//
//  ProductInfoCell.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ProductInfoCell: BaseTableViewCell {

  //MARK:- Constant

  struct UI {
    struct TitleLabel {
      static let topMargin: CGFloat = 32
      static let leadingMargin: CGFloat = 24
      static let trailingMargin: CGFloat = -24
    }
    struct PriceLabel {
      static let topMargin: CGFloat = 28
      static let leadingMargin: CGFloat = 24
      static let trailingMargin: CGFloat = -24
    }
    struct LineView {
      static let topMargin: CGFloat = 32
      static let leadingMargin: CGFloat = 24
      static let trailingMargin: CGFloat = -24
      static let height: CGFloat = 2
    }
  }

  //MARK:- UI Properties

  let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = Application.color.dark
    label.font = Application.font.sfProTextHeavy(size: 32)
    label.textAlignment = .left
    label.numberOfLines = 0
    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 48)
    return label
  }()

  let priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = Application.color.main
    label.font = Application.font.sfProTextHeavy(size: 20)
    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 24)
    return label
  }()

  let lineView: UIView = {
    let view = UIView()
    view.backgroundColor = Application.color.paleGrey
    return view
  }()

  //MARK:- Properties

  var viewModel: ProductInfoCellViewModel? {
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
    [titleLabel, priceLabel, lineView].forEach {
      addSubview($0)
    }
  }

  override func setupConstraints() {

    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UI.TitleLabel.topMargin)
      $0.leading.equalToSuperview().offset(UI.TitleLabel.leadingMargin)
      $0.trailing.equalToSuperview().offset(UI.TitleLabel.trailingMargin)
    }

    priceLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(UI.PriceLabel.topMargin)
      $0.leading.equalToSuperview().offset(UI.PriceLabel.leadingMargin)
      $0.trailing.lessThanOrEqualToSuperview().offset(UI.PriceLabel.trailingMargin)
    }

    lineView.snp.makeConstraints {
      $0.top.equalTo(priceLabel.snp.bottom).offset(UI.LineView.topMargin)
      $0.leading.equalToSuperview().offset(UI.LineView.leadingMargin)
      $0.trailing.equalToSuperview().offset(UI.LineView.trailingMargin)
      $0.height.equalTo(UI.LineView.height)
      $0.bottom.lessThanOrEqualToSuperview()
    }
  }

  func configureView() {
    guard let viewModel = viewModel else { return }
    titleLabel.text = viewModel.title
    priceLabel.text = viewModel.price
  }

}

