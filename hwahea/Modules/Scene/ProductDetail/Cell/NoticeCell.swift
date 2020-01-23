//
//  NoticeCell.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class NoticeCell: BaseTableViewCell {

  //MARK:- Constant

  struct UI {
    struct NoticeBackgroundView {
      static let cornerRadius: CGFloat = 14
      static let leadinMargin: CGFloat = 24
      static let trailingMargin: CGFloat = -24
      static let bottomMargin: CGFloat = -114
    }
    struct NoticeLabel {
      static let topMargin: CGFloat = 16
      static let bottomMargin: CGFloat = -26
      static let leadinMargin: CGFloat = 18
      static let trailingMargin: CGFloat = -18
    }
  }

  //MARK:- UI Properties

  let noticeBackgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = Application.color.paleGrey2
    view.layer.cornerRadius = UI.NoticeBackgroundView.cornerRadius
    view.layer.masksToBounds = true
    return view
  }()

  let noticeLabel: UILabel = {
    let label = UILabel()
    label.font = Application.font.notoSansBold(size: 12)
    label.textColor = Application.color.coolGrey
    label.numberOfLines = 0
    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 18)
    label.text = "부랑구마켓은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 부랑구마켓은 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다."
    return label
  }()


  //MARK:- Life Cycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  //MARK:- Methods

  override func setupUI() {
    addSubview(noticeBackgroundView)
    noticeBackgroundView.addSubview(noticeLabel)
  }

  override func setupConstraints() {
    noticeBackgroundView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalToSuperview().offset(UI.NoticeBackgroundView.leadinMargin)
      $0.trailing.equalToSuperview().offset(UI.NoticeBackgroundView.trailingMargin)
      $0.bottom.equalToSuperview().offset(UI.NoticeBackgroundView.bottomMargin)
    }

    noticeLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UI.NoticeLabel.topMargin)
      $0.leading.equalToSuperview().offset(UI.NoticeLabel.leadinMargin)
      $0.trailing.equalToSuperview().offset(UI.NoticeLabel.trailingMargin)
      $0.bottom.equalToSuperview().offset(UI.NoticeLabel.bottomMargin)
    }
  }
}


