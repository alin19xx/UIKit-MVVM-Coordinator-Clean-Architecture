//
//  StarlinkUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 26/12/24.
//

import Foundation

protocol StarlinkUseCase {
    func execute() async throws -> [StarlinkEntity]
}

final class DefaultStarlinkUseCase: StarlinkUseCase {
    private let repository: StarlinkRepository

    init(repository: StarlinkRepository = DefaultStarlinkRepository()) {
        self.repository = repository
    }

    func execute() async throws -> [StarlinkEntity] {
        let decodables = try await repository.fetchSatellites()
        return try decodables.map { try StarlinkEntity(from: $0) }
    }
}
