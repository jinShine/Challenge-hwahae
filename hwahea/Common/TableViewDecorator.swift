//
//  TableViewDecorator.swift
//  hwahea
//
//  Created by Seungjin on 21/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

protocol TableViewDecorator {

  func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
