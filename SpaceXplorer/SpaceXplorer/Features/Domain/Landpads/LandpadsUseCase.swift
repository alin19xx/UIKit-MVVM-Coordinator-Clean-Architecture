//
//  LandpadsUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation

protocol LandPadUseCase {
    /// Fetches the next page of data.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of items to fetch in a single request.
    ///
    /// - Returns: A `Page<LaunchEntity>` containing the items and metadata for the fetched page.
    ///
    /// - Throws: An error if the data fetching fails
    func execute(limit: Int) async throws -> Page<LandPadEntity>
    
    /// Resets the pagination state to its initial values.
    ///
    /// Call this method to clear cached data and restart pagination from the beginning.
    func resetPagination()
}

final class DefaultLandPadUseCase: LandPadUseCase {
    private let repository: LandPadsRepository
    private var currentPage: Page<LandPadEntity>?
    
    init(repository: LandPadsRepository = DefaultLandPadsRepository()) {
        self.repository = repository
    }

    func execute(limit: Int) async throws -> Page<LandPadEntity> {
        let offset = currentPage?.offset ?? 0
        let hasMorePages = currentPage?.hasMorePages ?? true
        
        // If no more pages, return the current data or an empty page
        guard hasMorePages else {
            return currentPage ?? Page(items: [],
                                       totalItems: 0,
                                       limit: limit,
                                       offset: offset)
        }
        
        let pageResponse = try await repository.fetchLandPads(limit: limit, offset: offset)
        
        // Create a new page with the fetched data
        let newPage = Page(
            items: pageResponse.docs.map { LandPadEntity(from: $0) },
            totalItems: pageResponse.totalDocs,
            limit: limit,
            offset: offset + pageResponse.docs.count
        )
        
        // Merge the new data with the existing data
        currentPage = currentPage?.merging(with: newPage) ?? newPage
        
        return newPage
    }

    func resetPagination() {
        currentPage = nil
    }
}
