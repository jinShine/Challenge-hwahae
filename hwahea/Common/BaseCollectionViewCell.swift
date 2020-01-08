//
//  BaseCollectionViewCell.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class BaseCollectionViewCell: UICollectionViewCell {
  
  //MARK:- Init

  override init(frame: CGRect) {
    super.init(frame: frame)
    
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
