//
//  ViewModelState.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 28/12/24.
//

import Foundation

enum ViewModelState: Hashable {
    case idle
    case loadingFirstPage
    case loadingMore
    case error(String)
    case loaded
}
