//
//  LaunchesUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 18/12/24.
//

import Foundation

protocol LaunchesUseCase {
    func execute(limit: Int) async throws -> PageEntity<LaunchEntity>
    func resetPagination()
}

final class DefaultLaunchesUseCase: LaunchesUseCase {
    private let repository: LaunchesRepository
    
    private var cachedEntities: [LaunchEntity] = []
    private var totalDocs: Int = 0
    private var currentOffset: Int = 0
    private var isLastPage: Bool = false

    init(repository: LaunchesRepository = DefaultLaunchesRepository()) {
        self.repository = repository
    }

    func execute(limit: Int) async throws -> PageEntity<LaunchEntity> {
        guard !isLastPage else {
            return PageEntity(docs: [],
                              totalDocs: totalDocs,
                              limit: limit,
                              offset: currentOffset)
        }
        
        let pageResponse = try await repository.fetchLaunches(limit: limit, offset: currentOffset)
        
        cachedEntities.append(contentsOf: pageResponse.docs.map { LaunchEntity(from: $0) })
        totalDocs = pageResponse.totalDocs
        currentOffset += pageResponse.docs.count
        
        if currentOffset >= totalDocs {
            isLastPage = true
        }
        
        return PageEntity(
            docs: pageResponse.docs.map { LaunchEntity(from: $0) },
            totalDocs: totalDocs,
            limit: limit,
            offset: currentOffset - pageResponse.docs.count
        )
    }

    func resetPagination() {
        cachedEntities = []
        totalDocs = 0
        currentOffset = 0
        isLastPage = false
    }
}
