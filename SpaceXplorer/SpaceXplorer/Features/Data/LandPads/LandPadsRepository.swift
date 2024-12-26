//
//  LandPadsRepository.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

protocol LandPadsRepository {
    func fetchLandPads() async throws -> [LandPadDecodable]
}

final class DefaultLandPadsRepository: LandPadsRepository {
    private let networkService: NetworkClientProtocol

    init(networkService: NetworkClientProtocol = NetworkClient()) {
        self.networkService = networkService
    }

    func fetchLandPads() async throws -> [LandPadDecodable] {
        let endpoint = SpaceXEndpoint.landpads
        return try await networkService.request(endpoint: endpoint)
    }
}
