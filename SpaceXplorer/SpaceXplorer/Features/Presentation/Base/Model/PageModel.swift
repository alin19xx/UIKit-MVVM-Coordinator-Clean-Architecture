//
//  PageModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 27/12/24.
//

import Foundation

struct PageModel<T> {
    let items: [T]
    let totalItems: Int
    let limit: Int
    let offset: Int
    
    var hasMorePages: Bool {
        return offset + items.count < totalItems
    }
}

extension PageModel {
    init(from entity: PageEntity<T>) {
        self.items = entity.docs
        self.totalItems = entity.totalDocs
        self.limit = entity.limit
        self.offset = entity.offset
    }
}
