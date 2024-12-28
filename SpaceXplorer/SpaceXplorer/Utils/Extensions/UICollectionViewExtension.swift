//
//  UICollectionViewExtension.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 28/12/24.
//

import UIKit

extension UICollectionView {
    
    final func register<T: UICollectionViewCell & ReusableCell>(cellType: T.Type) {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UICollectionViewCell & ReusableCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue reusable cell with identifier '\(T.reuseIdentifier)'. Did you forget to register the cell first?")
        }
        return cell
    }
    
    final func register<T: UICollectionReusableView & ReusableCell>(supplementaryViewType: T.Type, ofKind kind: String) {
        register(supplementaryViewType.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    final func dequeueReusableSupplementaryView<T: UICollectionReusableView & ReusableCell>(ofKind kind: String, for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue reusable supplementary view with identifier '\(T.reuseIdentifier)'. Did you forget to register the view first?")
        }
        return view
    }
}
