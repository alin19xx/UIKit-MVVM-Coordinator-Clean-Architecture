//
//  DragonsRepository.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

protocol DragonsRepository {
    func fetchDragons() async throws -> [DragonDecodable]
}

final class DefaultDragonsRepository: DragonsRepository {
    private let networkService: NetworkClientProtocol

    init(networkService: NetworkClientProtocol = NetworkClient()) {
        self.networkService = networkService
    }

    func fetchDragons() async throws -> [DragonDecodable] {
        let endpoint = SpaceXEndpoint.dragons
        return try await networkService.request(endpoint: endpoint)
    }
}
