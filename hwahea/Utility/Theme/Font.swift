//
//  Font.swift
//  hwahea
//
//  Created by Seungjin on 08/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

struct Font {
  
  //MARK:- Apple SDGothicNeo
  
  func appleSDGothicNeoRegular(size: CGFloat) -> UIFont {
    return UIFont(name: "AppleSDGothicNeo-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func appleSDGothicNeoBold(size: CGFloat) -> UIFont {
    return UIFont(name: "AppleSDGothicNeo-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  //MARK:- Noto Sans
  
  func notoSansBlack(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Black", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func notoSansBold(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
  }

  //MARK:- SF Pro

  func sfProTextHeavy(size: CGFloat) -> UIFont {
    return UIFont(name: "SFProText-Heavy", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
}
