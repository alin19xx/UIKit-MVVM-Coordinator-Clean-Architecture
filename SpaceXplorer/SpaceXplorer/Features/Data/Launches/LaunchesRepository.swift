//
//  LaunchesRepository.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

protocol LaunchesRepository {
    func fetchLaunches(limit: Int, offset: Int) async throws -> PageResponse<LaunchDecodable>
}

final class DefaultLaunchesRepository: LaunchesRepository {
    private let networkService: NetworkClientProtocol

    init(networkService: NetworkClientProtocol = NetworkClient()) {
        self.networkService = networkService
    }

    func fetchLaunches(limit: Int, offset: Int) async throws -> PageResponse<LaunchDecodable> {
        let endpoint = SpaceXEndpoint.launches(limit: limit, offset: offset)
        let response: PageResponse<LaunchDecodable> = try await networkService.request(endpoint: endpoint)
        return response
    }
}
