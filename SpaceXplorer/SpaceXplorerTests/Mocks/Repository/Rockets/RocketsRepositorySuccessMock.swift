//
//  RocketsRepositorySuccessMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation
@testable import SpaceXplorer

class RocketsRepositorySuccessMock: RocketsRepository {
    func fetchRockets() async throws -> [RocketDecodable] {
        let data = RocketsMock.makeJsonMock()
        let decoder = JSONDecoder()
        return try decoder.decode([RocketDecodable].self, from: data)
    }
}
