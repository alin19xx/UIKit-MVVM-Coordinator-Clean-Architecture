//
//  LaunchesMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation

struct LaunchesMock {
    static func makeJsonMock() -> Data {
        """
        {
          "docs": [
            {
              "id": "5eb87d42ffd86e000604b384",
              "name": "Starlink-15 (v1.0)",
              "date_utc": "2020-10-24T15:31:00.000Z",
              "success": true,
              "rocket": "5e9d0d95eda69973a809d1ec",
              "launchpad": "5e9e3032383ecb267a34e7c7",
              "details": "This mission launches the 15th batch of approximately 60 satellites for SpaceX's Starlink broadband network.",
              "payloads": ["5eb0e4b5b6c3bb0006eeb257"],
              "links": {
                "webcast": "https://youtu.be/J442-ti-Dhg",
                "article": "https://spaceflightnow.com/2020/10/24/spacex-launches-15th-batch-of-starlink-satellites/",
                "wikipedia": "https://en.wikipedia.org/wiki/Starlink"
              }
            },
            {
              "id": "5eb87d41ffd86e000604b383",
              "name": "Starlink-14 (v1.0)",
              "date_utc": "2020-10-18T12:25:00.000Z",
              "success": true,
              "rocket": "5e9d0d95eda69973a809d1ec",
              "launchpad": "5e9e3032383ecb267a34e7c7",
              "details": "This mission launches the 14th batch of approximately 60 satellites for SpaceX's Starlink broadband network.",
              "payloads": ["5eb0e4b5b6c3bb0006eeb255"],
              "links": {
                "webcast": "https://youtu.be/8O8Z2yPyTnc",
                "article": "https://spaceflightnow.com/2020/10/18/spacex-launches-14th-batch-of-starlink-satellites/",
                "wikipedia": "https://en.wikipedia.org/wiki/Starlink"
              }
            }
          ],
          "totalDocs": 150,
          "limit": 5,
          "offset": 0,
          "hasNextPage": true,
          "hasPrevPage": false,
          "totalPages": 30,
          "page": 1
        }
        """.data(using: .utf8)!
    }
}
