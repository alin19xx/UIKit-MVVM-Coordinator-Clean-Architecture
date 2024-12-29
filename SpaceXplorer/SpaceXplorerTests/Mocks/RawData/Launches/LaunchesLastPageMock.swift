//
//  LaunchesLastPageMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation

struct LaunchesLastPageMock {
    static func makeJsonMock() -> Data {
        """
        {
            "docs": [
                {
                    "fairings": {
                        "reused": null,
                        "recovery_attempt": null,
                        "recovered": null,
                        "ships": []
                    },
                    "links": {
                        "patch": {
                            "small": null,
                            "large": null
                        },
                        "reddit": {
                            "campaign": null,
                            "launch": null,
                            "media": null,
                            "recovery": null
                        },
                        "flickr": {
                            "small": [],
                            "original": []
                        },
                        "presskit": null,
                        "webcast": null,
                        "youtube_id": null,
                        "article": null,
                        "wikipedia": null
                    },
                    "static_fire_date_utc": null,
                    "static_fire_date_unix": null,
                    "net": false,
                    "window": null,
                    "rocket": "5e9d0d95eda69973a809d1ec",
                    "success": null,
                    "failures": [],
                    "details": null,
                    "crew": [],
                    "ships": [],
                    "capsules": [],
                    "payloads": [],
                    "launchpad": "5e9e4501f509094ba4566f84",
                    "flight_number": 198,
                    "name": "SES-18 & SES-19",
                    "date_utc": "2022-11-01T00:00:00.000Z",
                    "date_unix": 1667260800,
                    "date_local": "2022-10-31T20:00:00-04:00",
                    "date_precision": "month",
                    "upcoming": true,
                    "cores": [
                        {
                            "core": null,
                            "flight": null,
                            "gridfins": true,
                            "legs": true,
                            "reused": false,
                            "landing_attempt": null,
                            "landing_success": null,
                            "landing_type": null,
                            "landpad": null
                        }
                    ],
                    "auto_update": true,
                    "tbd": false,
                    "launch_library_id": null,
                    "id": "633f72000531f07b4fdf59c2"
                },
                {
                    "fairings": {
                        "reused": null,
                        "recovery_attempt": null,
                        "recovered": null,
                        "ships": []
                    },
                    "links": {
                        "patch": {
                            "small": null,
                            "large": null
                        },
                        "reddit": {
                            "campaign": null,
                            "launch": null,
                            "media": null,
                            "recovery": null
                        },
                        "flickr": {
                            "small": [],
                            "original": []
                        },
                        "presskit": null,
                        "webcast": null,
                        "youtube_id": null,
                        "article": null,
                        "wikipedia": null
                    },
                    "static_fire_date_utc": null,
                    "static_fire_date_unix": null,
                    "net": false,
                    "window": null,
                    "rocket": "5e9d0d95eda69974db09d1ed",
                    "success": null,
                    "failures": [],
                    "details": null,
                    "crew": [],
                    "ships": [],
                    "capsules": [],
                    "payloads": [],
                    "launchpad": "5e9e4502f509094188566f88",
                    "flight_number": 202,
                    "name": "Viasat-3 & Arcturus",
                    "date_utc": "2022-12-01T00:00:00.000Z",
                    "date_unix": 1669852800,
                    "date_local": "2022-11-30T19:00:00-05:00",
                    "date_precision": "month",
                    "upcoming": true,
                    "cores": [
                        {
                            "core": null,
                            "flight": null,
                            "gridfins": true,
                            "legs": true,
                            "reused": false,
                            "landing_attempt": null,
                            "landing_success": null,
                            "landing_type": null,
                            "landpad": null
                        },
                        {
                            "core": null,
                            "flight": null,
                            "gridfins": true,
                            "legs": true,
                            "reused": false,
                            "landing_attempt": null,
                            "landing_success": null,
                            "landing_type": null,
                            "landpad": null
                        },
                        {
                            "core": null,
                            "flight": null,
                            "gridfins": true,
                            "legs": true,
                            "reused": false,
                            "landing_attempt": null,
                            "landing_success": null,
                            "landing_type": null,
                            "landpad": null
                        }
                    ],
                    "auto_update": true,
                    "tbd": false,
                    "launch_library_id": null,
                    "id": "633f72130531f07b4fdf59c3"
                },
                {
                    "fairings": {
                        "reused": null,
                        "recovery_attempt": null,
                        "recovered": null,
                        "ships": []
                    },
                    "links": {
                        "patch": {
                            "small": null,
                            "large": null
                        },
                        "reddit": {
                            "campaign": null,
                            "launch": null,
                            "media": null,
                            "recovery": null
                        },
                        "flickr": {
                            "small": [],
                            "original": []
                        },
                        "presskit": null,
                        "webcast": null,
                        "youtube_id": null,
                        "article": null,
                        "wikipedia": null
                    },
                    "static_fire_date_utc": null,
                    "static_fire_date_unix": null,
                    "net": false,
                    "window": null,
                    "rocket": "5e9d0d95eda69973a809d1ec",
                    "success": null,
                    "failures": [],
                    "details": null,
                    "crew": [],
                    "ships": [],
                    "capsules": [],
                    "payloads": [],
                    "launchpad": "5e9e4501f509094ba4566f84",
                    "flight_number": 193,
                    "name": "ispace Mission 1 & Rashid",
                    "date_utc": "2022-11-22T00:00:00.000Z",
                    "date_unix": 1669075200,
                    "date_local": "2022-11-21T19:00:00-05:00",
                    "date_precision": "day",
                    "upcoming": true,
                    "cores": [
                        {
                            "core": null,
                            "flight": null,
                            "gridfins": true,
                            "legs": true,
                            "reused": false,
                            "landing_attempt": null,
                            "landing_success": null,
                            "landing_type": null,
                            "landpad": null
                        }
                    ],
                    "auto_update": true,
                    "tbd": false,
                    "launch_library_id": null,
                    "id": "633f723d0531f07b4fdf59c4"
                },
                {
                    "fairings": {
                        "reused": null,
                        "recovery_attempt": null,
                        "recovered": null,
                        "ships": []
                    },
                    "links": {
                        "patch": {
                            "small": null,
                            "large": null
                        },
                        "reddit": {
                            "campaign": null,
                            "launch": null,
                            "media": null,
                            "recovery": null
                        },
                        "flickr": {
                            "small": [],
                            "original": []
                        },
                        "presskit": null,
                        "webcast": null,
                        "youtube_id": null,
                        "article": null,
                        "wikipedia": null
                    },
                    "static_fire_date_utc": null,
                    "static_fire_date_unix": null,
                    "net": false,
                    "window": null,
                    "rocket": "5e9d0d95eda69973a809d1ec",
                    "success": null,
                    "failures": [],
                    "details": null,
                    "crew": [],
                    "ships": [],
                    "capsules": [],
                    "payloads": [],
                    "launchpad": "5e9e4502f509092b78566f87",
                    "flight_number": 197,
                    "name": "SWOT",
                    "date_utc": "2022-12-05T00:00:00.000Z",
                    "date_unix": 1670198400,
                    "date_local": "2022-12-04T16:00:00-08:00",
                    "date_precision": "day",
                    "upcoming": true,
                    "cores": [
                        {
                            "core": null,
                            "flight": null,
                            "gridfins": true,
                            "legs": true,
                            "reused": false,
                            "landing_attempt": null,
                            "landing_success": null,
                            "landing_type": null,
                            "landpad": null
                        }
                    ],
                    "auto_update": true,
                    "tbd": false,
                    "launch_library_id": null,
                    "id": "633f724c0531f07b4fdf59c5"
                },
                {
                    "fairings": {
                        "reused": null,
                        "recovery_attempt": null,
                        "recovered": null,
                        "ships": []
                    },
                    "links": {
                        "patch": {
                            "small": null,
                            "large": null
                        },
                        "reddit": {
                            "campaign": null,
                            "launch": null,
                            "media": null,
                            "recovery": null
                        },
                        "flickr": {
                            "small": [],
                            "original": []
                        },
                        "presskit": null,
                        "webcast": null,
                        "youtube_id": null,
                        "article": null,
                        "wikipedia": null
                    },
                    "static_fire_date_utc": null,
                    "static_fire_date_unix": null,
                    "net": false,
                    "window": null,
                    "rocket": "5e9d0d95eda69973a809d1ec",
                    "success": null,
                    "failures": [],
                    "details": null,
                    "crew": [],
                    "ships": [],
                    "capsules": [],
                    "payloads": [],
                    "launchpad": "5e9e4501f509094ba4566f84",
                    "flight_number": 198,
                    "name": "Transporter-6",
                    "date_utc": "2022-12-01T00:00:00.000Z",
                    "date_unix": 1669852800,
                    "date_local": "2022-11-30T19:00:00-05:00",
                    "date_precision": "month",
                    "upcoming": true,
                    "cores": [
                        {
                            "core": null,
                            "flight": null,
                            "gridfins": true,
                            "legs": true,
                            "reused": false,
                            "landing_attempt": null,
                            "landing_success": null,
                            "landing_type": null,
                            "landpad": null
                        }
                    ],
                    "auto_update": true,
                    "tbd": false,
                    "launch_library_id": null,
                    "id": "633f72580531f07b4fdf59c6"
                }
            ],
            "totalDocs": 205,
            "offset": 200,
            "limit": 5,
            "totalPages": 41,
            "page": 41,
            "pagingCounter": 201,
            "hasPrevPage": true,
            "hasNextPage": false,
            "prevPage": 40,
            "nextPage": null
        }
        """.data(using: .utf8)!
    }
}
