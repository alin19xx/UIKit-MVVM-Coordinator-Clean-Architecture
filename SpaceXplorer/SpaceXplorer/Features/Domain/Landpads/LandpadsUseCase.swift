//
//  LandpadsUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation

protocol LandPadsUseCase {
    func execute() async throws -> [LandPadEntity]
}

final class DefaultLandPadsUseCase: LandPadsUseCase {
    private let repository: LandPadsRepository
    
    init(repository: LandPadsRepository = DefaultLandPadsRepository()) {
        self.repository = repository
    }
    
    func execute() async throws -> [LandPadEntity] {
        let landPads = try await repository.fetchLandPads()
        return landPads.map { LandPadEntity(from: $0) }
    }
}
