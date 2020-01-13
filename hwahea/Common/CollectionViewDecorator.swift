//
//  CollectionViewDecorator.swift
//  hwahea
//
//  Created by Seungjin on 13/01/2020.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

protocol CollectionViewDecorator {

  func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
