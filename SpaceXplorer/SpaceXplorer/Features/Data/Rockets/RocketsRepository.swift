//
//  RocketsRepository.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

protocol RocketsRepository {
    func fetchRockets() async throws -> [RocketDecodable]
}

final class DefaultRocketsRepository: RocketsRepository {
    private let networkService: NetworkClientProtocol

    init(networkService: NetworkClientProtocol = NetworkClient()) {
        self.networkService = networkService
    }

    func fetchRockets() async throws -> [RocketDecodable] {
        let endpoint = SpaceXEndpoint.rockets
        return try await networkService.request(endpoint: endpoint)
    }
}
