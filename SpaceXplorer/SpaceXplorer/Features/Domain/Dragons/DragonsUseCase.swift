//
//  DragonsUseCase.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 21/12/24.
//

import Foundation

protocol DragonsUseCase {
    func execute() async throws -> [DragonEntity]
}

final class DefaultDragonsUseCase: DragonsUseCase {
    private let repository: DragonsRepository
    
    init(repository: DragonsRepository = DefaultDragonsRepository()) {
        self.repository = repository
    }
    
    func execute() async throws -> [DragonEntity] {
        let dragons = try await repository.fetchDragons()
        return dragons.map { DragonEntity(from: $0) }
    }
}
