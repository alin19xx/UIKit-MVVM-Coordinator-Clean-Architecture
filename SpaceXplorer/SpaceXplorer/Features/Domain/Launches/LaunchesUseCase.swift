//
//  LaunchesUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 18/12/24.
//

import Foundation

protocol LaunchesUseCase {
    /// Fetches the next page of data.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of items to fetch in a single request.
    ///
    /// - Returns: A `Page<LaunchEntity>` containing the items and metadata for the fetched page.
    ///
    /// - Throws: An error if the data fetching fails
    func execute(limit: Int) async throws -> Page<LaunchEntity>
}

final class DefaultLaunchesUseCase: LaunchesUseCase {
    private let repository: LaunchesRepository
    private var currentPage: Page<LaunchEntity>?

    init(repository: LaunchesRepository = DefaultLaunchesRepository()) {
        self.repository = repository
    }

    func execute(limit: Int) async throws -> Page<LaunchEntity> {
        let offset = currentPage?.offset ?? 0
        let hasMorePages = currentPage?.hasNextPage ?? true

        // If no more pages, return the current data or an empty page
        guard hasMorePages else {
            return Page(
                items: [],
                totalItems: 0,
                limit: limit,
                offset: offset,
                hasNextPage: false,
                hasPrevPage: false
            )
        }

        let pageResponse = try await repository.fetchLaunches(limit: limit, offset: offset)
        
        // Create a new page with the fetched data
        let newPage = Page(
            items: pageResponse.docs.map { LaunchEntity(from: $0) },
            totalItems: pageResponse.totalDocs,
            limit: pageResponse.limit,
            offset: pageResponse.offset + pageResponse.docs.count,
            hasNextPage: pageResponse.hasNextPage,
            hasPrevPage: pageResponse.hasPrevPage
        )
        
        // Merge the new data with the existing data
        currentPage = currentPage?.merging(with: newPage) ?? newPage

        return newPage
    }

    func resetPagination() {
        currentPage = nil
    }
}
