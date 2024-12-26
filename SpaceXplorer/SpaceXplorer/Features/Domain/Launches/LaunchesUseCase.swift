//
//  LaunchesUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 18/12/24.
//

import Foundation

protocol LaunchesUseCase {
    func execute() async throws -> [LaunchEntity]
}

final class DefaultLaunchesUseCase: LaunchesUseCase {
    private let repository: LaunchesRepository
    
    init(repository: LaunchesRepository = DefaultLaunchesRepository()) {
        self.repository = repository
    }

    func execute() async throws -> [LaunchEntity] {
        let decodables = try await repository.fetchLaunches()
        return try decodables.map { try LaunchEntity(from: $0) }
    }
}
