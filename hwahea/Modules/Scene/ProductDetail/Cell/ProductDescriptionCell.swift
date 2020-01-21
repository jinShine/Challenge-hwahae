//
//  ProductDescriptionCell.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class ProductDescriptionCell: BaseTableViewCell {

  //MARK:- Constant

  struct UI {
    static let basicMargin: CGFloat = 24
  }

  //MARK:- UI Properties

  let descriptionLabel: UILabel = {
    let label = UILabel()
//    label.font = Application.font.notoSansBold(size: 16)
//    label.textColor = Application.color.dark
    label.numberOfLines = 0
//    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 28)
    return label
  }()


  //MARK:- Properties

  var viewModel: ProductDescriptionCellViewModel! {
    didSet {
      self.descriptionLabel.text = viewModel.description
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
    addSubview(descriptionLabel)
  }

  override func setupConstraints() {
    descriptionLabel.snp.makeConstraints {
      $0.top.leading.equalToSuperview().offset(UI.basicMargin)
      $0.trailing.equalToSuperview().offset(-UI.basicMargin)
      $0.bottom.equalToSuperview()
    }
  }

}

