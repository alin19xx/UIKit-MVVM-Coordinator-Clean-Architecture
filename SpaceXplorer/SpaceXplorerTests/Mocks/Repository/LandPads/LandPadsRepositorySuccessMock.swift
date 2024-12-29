//
//  LandPadsRepositorySuccessMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation
@testable import SpaceXplorer

final class LandPadsRepositorySuccessMock: LandPadsRepository {
    private let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func fetchLandPads(limit: Int, offset: Int) async throws -> PageResponse<LandPadDecodable> {
        let decoder = JSONDecoder()
        return try decoder.decode(PageResponse<LandPadDecodable>.self, from: data)
    }
}
