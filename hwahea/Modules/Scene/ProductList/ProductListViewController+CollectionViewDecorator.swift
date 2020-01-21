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

    return viewModel.numberOfSections()
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {

    return viewModel.numberOfItemsSection()
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    return configureCell(collectionView: collectionView, indexPath: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      viewForSupplementaryElementOfKind kind: String,
                      at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
      return UICollectionViewCell()
    case UICollectionView.elementKindSectionFooter:
      guard let footer = collectionView.dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionFooter,
        withReuseIdentifier: RefreshFooterView.reuseIdentifier,
        for: indexPath
        ) as? RefreshFooterView else { return UICollectionReusableView() }
      refreshFooterView = footer
      
      return footer
    default:
      fatalError("Unknow kind")
    }
  }
}

//MARK:- CollectionView delegate

extension ProductListViewController: UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    openDetail(at: indexPath)
  }

  func collectionView(_ collectionView: UICollectionView,
                      willDisplay cell: UICollectionViewCell,
                      forItemAt indexPath: IndexPath) {
    viewModel.loadMore(at: indexPath) { [weak self] response in
      self?.refreshFooterView?.endRefreshing()
      guard response.result == .success else {
        DLog(response.error?.message)
        return
      }

      self?.reload()
    }
  }
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

//MARK:- CollectionView decorator
extension ProductListViewController: CollectionViewDecorator {

  func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {

    switch ProductListViewModel.CellType(rawValue: indexPath.section) {
    case .product:
      guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath
        ) as? ProductCell else {
          return UICollectionViewCell()
      }

      let product = viewModel.products[indexPath.row]
      cell.viewModel = ProductCellViewModel(product: product)

      return cell
    default:
      return UICollectionViewCell()
    }
  }
}
