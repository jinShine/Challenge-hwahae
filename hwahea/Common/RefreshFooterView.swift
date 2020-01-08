//
//  RefreshFooterView.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit
import SnapKit

class RefreshFooterView: UICollectionReusableView {

  //MARK:- Constant
  
  struct UI {
    static let refreshControlSize: CGFloat = 20
  }


  //MARK:- UI Properties

  let refreshControl: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "explore")
    imageView.tintColor = Application.color.blueGrey
    return imageView
  }()


  //MARK:- Properties

  var isRefreshing: Bool = false


  //MARK:- Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupConstraints()
    startRefreshing()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
    setupConstraints()
    startRefreshing()
  }

  deinit {
    refreshControl.layer.removeAllAnimations()
  }


  //MARK:- Methods

  private func setupUI() {
    addSubview(refreshControl)
    refreshControl.layer.add(refreshAnimation(), forKey: "refresh")
  }

  private func setupConstraints() {
    refreshControl.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.size.equalTo(UI.refreshControlSize)
    }
  }

  func startRefreshing() {
    isRefreshing = true
    refreshControl.isHidden = false
  }

  func endRefreshing() {
    isRefreshing = false
    refreshControl.isHidden = true
  }

  private func refreshAnimation() -> CABasicAnimation {
    let anim = CABasicAnimation(keyPath: "transform.rotation")
    anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    anim.fromValue = 0
    anim.toValue = 6 * Double.pi
    anim.duration = 1.5
    anim.repeatCount = HUGE
    anim.isRemovedOnCompletion = false
    anim.speed = 1

    return anim
  }

}
