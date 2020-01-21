//
//  ProductDetailViewController+TableViewDecorator.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

extension ProductDetailViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }


}

extension ProductDetailViewController: UITableViewDelegate {

}

extension ProductDetailViewController: TableViewDecorator {

  func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
