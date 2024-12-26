//
//  RocketsUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 19/12/24.
//

import Foundation

protocol RocketsUseCase {
    func execute() async throws -> [RocketEntity]
}

final class DefaultRocketsUseCase: RocketsUseCase {
    private let repository: RocketsRepository
    
    init(repository: RocketsRepository = DefaultRocketsRepository()) {
        self.repository = repository
    }
    
    func execute() async throws -> [RocketEntity] {
        let rockets = try await repository.fetchRockets()
        return rockets.map { RocketEntity(from: $0) }
    }
}
