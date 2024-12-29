//
//  LaunchesRepositorySuccessMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation
@testable import SpaceXplorer

final class LaunchesRepositorySuccessMock: LaunchesRepository {
    private let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func fetchLaunches(limit: Int, offset: Int) async throws -> PageResponse<LaunchDecodable> {
        let decoder = JSONDecoder()
        return try decoder.decode(PageResponse<LaunchDecodable>.self, from: data)
    }
}
