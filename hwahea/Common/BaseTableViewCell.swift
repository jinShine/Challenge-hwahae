//
//  BaseTableViewCell.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class BaseTableViewCell: UITableViewCell {

  //MARK:- Init

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setupUI()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)

    setupUI()
    setupConstraints()
  }


  //MARK:- Methods

  func setupUI() { }

  func setupConstraints() { }

}
