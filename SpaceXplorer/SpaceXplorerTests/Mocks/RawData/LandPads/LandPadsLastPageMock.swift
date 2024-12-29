//
//  LandPadsLastPageMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation

struct LandPadsLastPageMock {
    static func makeJsonMock() -> Data {
        """
        {
            "docs": [
                {
                    "images": {
                        "large": [
                            "https://i.imgur.com/46y4O15.png"
                        ]
                    },
                    "name": "JRTI",
                    "full_name": "Just Read The Instructions",
                    "status": "active",
                    "type": "ASDS",
                    "locality": "Port Canaveral",
                    "region": "Florida",
                    "latitude": 28.4104,
                    "longitude": -80.6188,
                    "landing_attempts": 40,
                    "landing_successes": 39,
                    "wikipedia": "https://en.wikipedia.org/wiki/Autonomous_spaceport_drone_ship",
                    "details": "The third ASDS barge, using the Marmac 303 hull, was built during 2015 in a Louisiana shipyard, and the barge transited the Panama Canal in June 2015 carrying its wing extensions as cargo on the deck because the ASDS, when complete, would be too wide to pass through the canal. The home port for the Marmac 303 is the Port of Los Angeles, at the AltaSea marine research and business campus in San Pedro's outer harbor. The landing platform and tender vessels began docking there in July 2015 in advance of the main construction of AltaSea which is scheduled for 2017. SpaceX announced that the Marmac 303 would be the second ASDS to be named Just Read the Instructions (JRtI) in January 2016, shortly before its first use as a landing platform for Falcon 9 Flight 21. On 17 January 2016, JRtI was put to first use in an attempt to recover a Falcon 9 first-stage booster from the Jason-3 mission from Vandenberg. The booster successfully landed on the deck; however, a lockout collet failed to engage on one of the legs causing the rocket to tip over, exploding on impact with the deck. On January 14, 2017, SpaceX launched Falcon 9 Flight 29 from Vandenberg and landed the first stage on the JRtI that was located about 370 km (230 mi) downrange in the Pacific Ocean, making it the first successful landing in the Pacific.",
                    "launches": [
                        "5eb87cf0ffd86e000604b343",
                        "5eb87cfdffd86e000604b34c",
                        "5eb87d05ffd86e000604b354",
                        "5eb87d08ffd86e000604b357",
                        "5eb87d0affd86e000604b359",
                        "5eb87d1fffd86e000604b36b",
                        "5eb87d25ffd86e000604b370",
                        "5eb87d28ffd86e000604b373",
                        "5eb87d45ffd86e000604b387",
                        "5eb87d4affd86e000604b38b",
                        "5eb87d50ffd86e000604b394",
                        "5ef6a2e70059c33cee4a8293",
                        "5eb87d4dffd86e000604b38e",
                        "5eb87d4bffd86e000604b38c",
                        "5eb87d4fffd86e000604b393",
                        "5fbfecce54ceb10a5664c80a",
                        "600f9a718f798e2a4d5f979d",
                        "605b4b6aaa5433645e37d03f",
                        "6079bd399a06446e8c61bf77",
                        "5fe3af6db3467846b3242160",
                        "5eb87d4effd86e000604b390",
                        "607a37565a906a44023e0866",
                        "618faad2563d69573ed8ca9d",
                        "6161c88d6db1a92bfba85348",
                        "6161d2006db1a92bfba85356",
                        "61fc0224e0dc5662b76489ab",
                        "6234908cf051102e1fcedac4",
                        "6243ad8baf52800c6e919252",
                        "6243ada6af52800c6e919253",
                        "62582a6f5988f159024b964b",
                        "625828f25988f159024b9643",
                        "6243ae0aaf52800c6e919257",
                        "62a9f08b20413d2695d88711",
                        "62a9f0c920413d2695d88712",
                        "62a9f0f820413d2695d88714",
                        "62a9f86420413d2695d88719",
                        "62f3b5330f55c50e192a4e6e",
                        "63161329ffc78f3b8567070b",
                        "63161339ffc78f3b8567070c",
                        "62dd70d5202306255024d139"
                    ],
                    "id": "5e9e3033383ecbb9e534e7cc"
                },
                {
                    "images": {
                        "large": [
                            "https://i.imgur.com/PkrS8vQ.png"
                        ]
                    },
                    "name": "ASOG",
                    "full_name": "A Shortfall of Gravitas",
                    "status": "active",
                    "type": "ASDS",
                    "locality": "Port Canaveral",
                    "region": "Florida",
                    "latitude": 33.7291858,
                    "longitude": -118.262015,
                    "landing_attempts": 21,
                    "landing_successes": 21,
                    "wikipedia": "https://en.wikipedia.org/wiki/Autonomous_spaceport_drone_ship",
                    "details": "The fourth ASDS barge was announced to be under construction in February 2018 and it will become the second active east coast-based ASDS. It will be homeported at Port Canaveral. This future simultaneously usable ASDS, along with OCISLY, is called A Shortfall of Gravitas (ASoG) and like the rest of the fleet, its naming is based on names used in the Culture series. The droneship is expected to be operational in mid-2019.",
                    "launches": [
                        "5fe3b11eb3467846b324216c",
                        "5fe3b15eb3467846b324216d",
                        "6161c94c6db1a92bfba85349",
                        "5fe3afc1b3467846b3242164",
                        "61d5eca1f88e4c5fc91f1eb7",
                        "61e048bbbe8d8b66799018d0",
                        "61e048ffbe8d8b66799018d1",
                        "61fc01dae0dc5662b76489a7",
                        "61fc0243e0dc5662b76489ae",
                        "61eefaa89eb1064137a1bd73",
                        "6243ade2af52800c6e919255",
                        "62582a855988f159024b964c",
                        "62615ebc0ec008379be596fa",
                        "6278481757b51b752c5c5a5f",
                        "6243aea5af52800c6e91925c",
                        "6243ae40af52800c6e919259",
                        "62a9f12820413d2695d88716",
                        "62a9f8b320413d2695d8871b",
                        "62f3b5200f55c50e192a4e6c",
                        "62f3b5290f55c50e192a4e6d",
                        "62a9f89a20413d2695d8871a"
                    ],
                    "id": "5e9e3033383ecb075134e7cd"
                }
            ],
            "totalDocs": 7,
            "offset": 5,
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
