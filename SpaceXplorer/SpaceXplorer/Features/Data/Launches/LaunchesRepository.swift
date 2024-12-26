//
//  LaunchesRepository.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

protocol LaunchesRepository {
    func fetchLaunches() async throws -> [LaunchDecodable]
}

final class DefaultLaunchesRepository: LaunchesRepository {
    private let networkService: NetworkClientProtocol

    init(networkService: NetworkClientProtocol = NetworkClient()) {
        self.networkService = networkService
    }

    func fetchLaunches() async throws -> [LaunchDecodable] {
        let endpoint = SpaceXEndpoint.launches
        return try await networkService.request(endpoint: endpoint)
    }
}
