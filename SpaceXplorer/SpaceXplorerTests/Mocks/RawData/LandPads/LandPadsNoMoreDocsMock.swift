//
//  LandPadsNoMoreDocsMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation

struct LandPadsNoMoreDocsMock {
    static func makeJsonMock() -> Data {
        """
        {
            "docs": [],
            "totalDocs": 7,
            "offset": 7,
            "limit": 5,
            "totalPages": 2,
            "page": 2,
            "pagingCounter": 6,
            "hasPrevPage": true,
            "hasNextPage": false,
            "prevPage": 1,
            "nextPage": null
        }
        """.data(using: .utf8)!
    }
}
