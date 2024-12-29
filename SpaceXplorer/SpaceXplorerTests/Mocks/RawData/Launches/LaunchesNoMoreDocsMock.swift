//
//  LaunchesNoMoreDocsMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation

struct LaunchesNoMoreDocsMock {
    static func makeJsonMock() -> Data {
        """
        {
            "docs": [],
            "totalDocs": 205,
            "offset": 205,
            "limit": 5,
            "totalPages": 41,
            "page": 42,
            "pagingCounter": 206,
            "hasPrevPage": true,
            "hasNextPage": false,
            "prevPage": 41,
            "nextPage": null
        }
        """.data(using: .utf8)!
    }
}
