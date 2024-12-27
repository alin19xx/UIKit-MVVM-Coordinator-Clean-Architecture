//
//  PageEntity.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 27/12/24.
//

import Foundation

struct PageEntity<T> {
    let docs: [T]
    let totalDocs: Int
    let limit: Int
    let offset: Int
    let hasMorePages: Bool

    init(docs: [T], totalDocs: Int, limit: Int, offset: Int) {
        self.docs = docs
        self.totalDocs = totalDocs
        self.limit = limit
        self.offset = offset
        self.hasMorePages = offset + docs.count < totalDocs
    }
}
