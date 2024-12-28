//
//  Page.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 27/12/24.
//

import Foundation

struct Page<T> {
    let items: [T]
    let totalItems: Int
    let limit: Int
    let offset: Int
    
    var hasMorePages: Bool {
        return offset + items.count < totalItems
    }
    
    func merging(with newPage: Page<T>) -> Page<T> {
        return Page(
            items: self.items + newPage.items,
            totalItems: self.totalItems,
            limit: self.limit,
            offset: newPage.offset
        )
    }
}
