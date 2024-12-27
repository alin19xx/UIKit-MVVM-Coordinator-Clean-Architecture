//
//  LandPadsRepository.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

protocol LandPadsRepository {
    func fetchLandPads(limit: Int, offset: Int) async throws -> PageResponse<LandPadDecodable>
}

final class DefaultLandPadsRepository: LandPadsRepository {
    private let networkService: NetworkClientProtocol

    init(networkService: NetworkClientProtocol = NetworkClient()) {
        self.networkService = networkService
    }

    func fetchLandPads(limit: Int, offset: Int) async throws -> PageResponse<LandPadDecodable> {
        let endpoint = SpaceXEndpoint.landpads(limit: limit, offset: offset)
        let response: PageResponse<LandPadDecodable> = try await networkService.request(endpoint: endpoint)
        return response
    }
}
