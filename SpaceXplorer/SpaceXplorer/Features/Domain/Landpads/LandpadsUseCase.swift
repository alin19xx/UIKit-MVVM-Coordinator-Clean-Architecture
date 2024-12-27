//
//  LandpadsUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation

protocol LandPadsUseCase {
    func execute(limit: Int) async throws -> PageEntity<LandPadEntity>
    func resetPagination()
}

final class DefaultLandPadsUseCase: LandPadsUseCase {
    private let repository: LandPadsRepository
    
    private var cachedEntities: [LandPadEntity] = []
    private var totalDocs: Int = 0
    private var currentOffset: Int = 0
    private var limit: Int = 0
    
    init(repository: LandPadsRepository = DefaultLandPadsRepository()) {
        self.repository = repository
    }
    
    func execute(limit: Int) async throws -> PageEntity<LandPadEntity> {
        guard currentOffset < totalDocs || cachedEntities.isEmpty else {
            return PageEntity(docs: cachedEntities,
                              totalDocs: totalDocs,
                              limit: limit,
                              offset: currentOffset)
        }
        
        let pageEntity = try await repository.fetchLandPads(limit: limit, offset: currentOffset)
        
        cachedEntities.append(contentsOf: pageEntity.docs.map { LandPadEntity(from: $0) })
        totalDocs = pageEntity.totalDocs
        currentOffset += limit

        return PageEntity(docs: cachedEntities,
                          totalDocs: totalDocs,
                          limit: limit,
                          offset: currentOffset
        )
    }
    
    func resetPagination() {
        cachedEntities = []
        totalDocs = 0
        currentOffset = 0
    }
}
