//
//  ProductListViewController+CollectionViewDecorator.swift
//  hwahea
//
//  Created by seungjin on 2020/01/08.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

//MARK:- CollectionView data source

extension ProductListViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      viewForSupplementaryElementOfKind kind: String,
                      at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
      return UICollectionViewCell()
    case UICollectionView.elementKindSectionFooter:
      let footer = collectionView.dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionFooter,
        withReuseIdentifier: RefreshFooterView.reuseIdentifier,
        for: indexPath
      ) as! RefreshFooterView
      refreshFooterView = footer
      
      return footer
    default:
      fatalError("Unknow kind")
    }
  }
}

//MARK:- CollectionView delegate

extension ProductListViewController: UICollectionViewDelegate {
  
}

extension ProductListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {

    let calculatedWidth = (
      (collectionView.frame.width - (UI.CollectionView.inset.left + UI.CollectionView.inset.right)) / UI.CollectionView.column)
      - UI.CollectionView.itemSpacing

    let calculatedHeight = calculatedWidth + UI.maxTitleHeight + UI.maxSellerHeight + UI.titleTopMargin

    return CGSize(width: calculatedWidth , height: calculatedHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    
    return UI.CollectionView.inset
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {

    return UI.CollectionView.lineSpacing
  }
  
}
