//
//  StarlinkRepository.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 26/12/24.
//

import Foundation

protocol StarlinkRepository {
    func fetchSatellites() async throws -> [StarlinkDecodable]
}

final class DefaultStarlinkRepository: StarlinkRepository {
    private let networkService: NetworkClientProtocol

    init(networkService: NetworkClientProtocol = NetworkClient()) {
        self.networkService = networkService
    }

    func fetchSatellites() async throws -> [StarlinkDecodable] {
        let endpoint = SpaceXEndpoint.starlink
        return try await networkService.request(endpoint: endpoint)
    }
}
