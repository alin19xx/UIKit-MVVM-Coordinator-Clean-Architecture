//
//  RocketDetailDelegate.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 28/12/24.
//

import Foundation
import UIKit

final class RocketDetailDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    private weak var pageControl: UIPageControl?

    init(pageControl: UIPageControl) {
        self.pageControl = pageControl
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else { return }
        let page = Int(scrollView.contentOffset.x / collectionView.frame.width)
        pageControl?.currentPage = page
    }
}
