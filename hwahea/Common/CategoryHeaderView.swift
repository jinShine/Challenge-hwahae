//
//  CategoryHeaderView.swift
//  hwahea
//
//  Created by Seungjin on 10/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit
import SnapKit

class CategoryHeaderView: UIView {

  enum SkinType: String {
    case oily = "지성",
    dry = "건성",
    sensitive = "민감성"
  }

  //MARK:- Constant

  struct UI {
    static let height: CGFloat = 50
    static let borderColor: CGColor = UIColor(r: 33, g: 47, b: 62, a: 0.1).cgColor
    static let margin: CGFloat = 12
  }

  //MARK:- UI Properties

  let categoryButton: UIButton = {
    let button = UIButton()
    button.setTitle("모든 피부 타입", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setImage(UIImage(named: "arrowDown"), for: .normal)
    button.semanticContentAttribute = .forceRightToLeft
    button.titleLabel?.font = Application.font.appleSDGothicNeoBold(size: 14)
    button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    return button
  }()

  //MARK:- UI Properties

  var skinTypeDidChange: ((UIButton) -> Void)?


  //MARK:- Initialize

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

  //MARK:- Setup
  private func setupUI() {
    backgroundColor = .white
    layer.borderColor = UI.borderColor
    layer.borderWidth = 1

    addSubview(categoryButton)
  }

  private func setupConstraints() {
    categoryButton.snp.makeConstraints {
      $0.leading.greaterThanOrEqualToSuperview()
      $0.trailing.equalToSuperview().offset(-UI.margin)
      $0.centerY.equalToSuperview()
    }
  }

  @objc
  func didTap() {
    skinTypeDidChange?(categoryButton)
  }

}
