//
//  StarlinkRepositorySuccessMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation
@testable import SpaceXplorer

class StarlinkRepositorySuccessMock: StarlinkRepository {
    func fetchSatellites() async throws -> [StarlinkDecodable] {
        let data = StarlinkMock.makeJsonMock()
        let decoder = JSONDecoder()
        return try decoder.decode([StarlinkDecodable].self, from: data)
    }
}
