//
//  ProductDetailViewController+TableViewDecorator.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

//MARK:- Tableview datasource

extension ProductDetailViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    self.configureCell(tableView: tableView, indexPath: indexPath)
  }


}

//MARK:- Tableview delegate

extension ProductDetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch ProductDetailViewModel.CellType(rawValue: indexPath.row) {
    case .productImage: return view.frame.width
    default: return UITableView.automaticDimension
    }
  }
}

//MARK:- Tableview decorator

extension ProductDetailViewController: TableViewDecorator {

  func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    switch ProductDetailViewModel.CellType(rawValue: indexPath.row) {
    case .productImage:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: ProductImageCell.reuseIdentifier, for: indexPath
        ) as? ProductImageCell else { return UITableViewCell() }

      if let product = viewModel.product {
        cell.viewModel = ProductImageCellViewModel(product: product)
      }

      return cell
    case .productInfo:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: ProductInfoCell.reuseIdentifier, for: indexPath
        ) as? ProductInfoCell else { return UITableViewCell() }

      if let product = viewModel.product {
        cell.viewModel = ProductInfoCellViewModel(product: product)
      }

      return cell
    case .productDescription:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: ProductDescriptionCell.reuseIdentifier, for: indexPath
        ) as? ProductDescriptionCell else { return UITableViewCell() }

      return cell
    case .notice:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: NoticeCell.reuseIdentifier, for: indexPath
        ) as? NoticeCell else { return UITableViewCell() }

      return cell
    default: return UITableViewCell()
    }
  }
}
