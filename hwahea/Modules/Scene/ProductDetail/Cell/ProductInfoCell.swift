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
    struct SellerButton {
      static let topMargin: CGFloat = 24
      static let leadingMargin: CGFloat = 26
      static let trailingMargin: CGFloat = -22
    }
    struct TitleButton {
      static let topMargin: CGFloat = 16
      static let leadingMargin: CGFloat = 24
      static let trailingMargin: CGFloat = -24
    }
    struct CoastStackView {
      static let spacingZero: CGFloat = 0
      static let spacingMargin: CGFloat = 12
      static let topMargin: CGFloat = 32
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

  let sellerLabel: UILabel = {
    let label = UILabel()
//    label.textColor = Application.color.darkSkyBlue
    label.font = Application.font.notoSansBlack(size: 12)
    label.textAlignment = .left
//    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 20)
    return label
  }()

  let titleLabel: UILabel = {
    let label = UILabel()
//    label.textColor = Application.color.dark
//    label.font = Application.font.sfProTextHeavy(size: 40)
    label.textAlignment = .left
    label.numberOfLines = 0
//    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 48)
    return label
  }()

  let discountRateLabel: UILabel = {
    let label = UILabel()
//    label.textColor = Application.color.coralPink
//    label.font = Application.font.sfProTextHeavy(size: 20)
    label.textAlignment = .left
//    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 24)
    return label
  }()

  let discountCostLabel: UILabel = {
    let label = UILabel()
//    label.textColor = Application.color.dark
//    label.font = Application.font.sfProTextHeavy(size: 20)
    label.textAlignment = .left
//    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 24)
    return label
  }()

  let costLabel: UILabel = {
    let label = UILabel()
//    label.textColor = Application.color.blueGrey
//    label.font = Application.font.appleSDGothicNeoBold(size: 20)
//    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 24)
    return label
  }()

  lazy var costStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [
      discountRateLabel,
      discountCostLabel,
      costLabel
    ])
    stackView.tintColor = .darkGray
    stackView.distribution = .equalSpacing
    stackView.axis = .horizontal
    return stackView
  }()

  let lineView: UIView = {
    let view = UIView()
//    view.backgroundColor = Application.color.paleGreyTwo
    return view
  }()

  //MARK:- Properties

  var viewModel: ProductInfoCellViewModel! {
    didSet {
      sellerLabel.text = viewModel.seller
      titleLabel.text = viewModel.title
      discountRateLabel.text = viewModel.discountRate
      discountCostLabel.text = viewModel.discountCost
      if discountRateLabel.text == nil && discountCostLabel.text == nil {
        costLabel.text = viewModel.cost
        costStackView.spacing = UI.CoastStackView.spacingZero
      } else {
        costStackView.spacing = UI.CoastStackView.spacingMargin
//        costLabel.attributedText = viewModel.cost.cancelLine()
      }
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
    [sellerLabel, titleLabel, costStackView, lineView].forEach {
      addSubview($0)
    }
  }

  override func setupConstraints() {
    sellerLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UI.SellerButton.topMargin)
      $0.leading.equalToSuperview().offset(UI.SellerButton.leadingMargin)
      $0.trailing.equalToSuperview().offset(UI.SellerButton.trailingMargin)
    }

    titleLabel.snp.makeConstraints {
      $0.top.equalTo(sellerLabel.snp.bottom).offset(UI.TitleButton.topMargin)
      $0.leading.equalToSuperview().offset(UI.TitleButton.leadingMargin)
      $0.trailing.equalToSuperview().offset(UI.TitleButton.trailingMargin)
    }

    costStackView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(UI.CoastStackView.topMargin)
      $0.leading.equalToSuperview().offset(UI.CoastStackView.leadingMargin)
      $0.trailing.lessThanOrEqualToSuperview().offset(UI.CoastStackView.trailingMargin)
    }

    lineView.snp.makeConstraints {
      $0.top.equalTo(costStackView.snp.bottom).offset(UI.LineView.topMargin)
      $0.leading.equalToSuperview().offset(UI.LineView.leadingMargin)
      $0.trailing.equalToSuperview().offset(UI.LineView.trailingMargin)
      $0.height.equalTo(UI.LineView.height)
      $0.bottom.lessThanOrEqualToSuperview()
    }
  }

}

