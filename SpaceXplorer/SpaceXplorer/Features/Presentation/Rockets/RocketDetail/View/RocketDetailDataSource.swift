//
//  RocketDetailDataSource.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 28/12/24.
//

import Foundation
import UIKit

final class RocketDetailDataSource: NSObject, UICollectionViewDataSource {
    
    private let collectionView: UICollectionView
    private let model: RocketModel
    
    init(collectionView: UICollectionView, model: RocketModel) {
        self.collectionView = collectionView
        self.model = model
    }
    
    func registerCells() {
        collectionView.register(cellType: RocketImageCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RocketImageCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: model.images[indexPath.row])
        return cell
    }
}
