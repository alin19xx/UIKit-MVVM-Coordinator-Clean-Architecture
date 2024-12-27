//
//  PaginatedUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 27/12/24.
//

import Foundation

protocol PaginatedUseCase {
    associatedtype Entity
    func fetchNextPage(limit: Int) async throws -> PageEntity<Entity>
    func resetPagination()
}

struct PaginationState {
    private(set) var totalDocs: Int = 0
    private(set) var offset: Int = 0
    private(set) var limit: Int = 0

    var hasMorePages: Bool { offset < totalDocs }

    mutating func update<T>(with page: PageEntity<T>) {
        totalDocs = page.totalDocs
        offset += page.docs.count
        limit = page.limit
    }
}
