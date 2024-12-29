//
//  LandPadsMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation

struct LandPadsMock {
    static func makeJsonMock() -> Data {
        """
        {
            "docs": [
                {
                    "images": {
                        "large": [
                            "https://i.imgur.com/KHBk6jO.png"
                        ]
                    },
                    "name": "LZ-1",
                    "full_name": "Landing Zone 1",
                    "status": "active",
                    "type": "RTLS",
                    "locality": "Cape Canaveral",
                    "region": "Florida",
                    "latitude": 28.485833,
                    "longitude": -80.544444,
                    "landing_attempts": 21,
                    "landing_successes": 20,
                    "wikipedia": "https://en.wikipedia.org/wiki/Landing_Zones_1_and_2",
                    "details": "SpaceX's first east coast landing pad is Landing Zone 1, where the historic first Falcon 9 landing occurred in December 2015. LC-13 was originally used as a launch pad for early Atlas missiles and rockets from Lockheed Martin. LC-1 was later expanded to include Landing Zone 2 for side booster RTLS Falcon Heavy missions, and it was first used in February 2018 for that purpose.",
                    "launches": [
                        "5eb87cefffd86e000604b342",
                        "5eb87cf9ffd86e000604b349",
                        "5eb87cfeffd86e000604b34d",
                        "5eb87d01ffd86e000604b350",
                        "5eb87d03ffd86e000604b352",
                        "5eb87d07ffd86e000604b356",
                        "5eb87d09ffd86e000604b358",
                        "5eb87d0effd86e000604b35c",
                        "5eb87d10ffd86e000604b35e",
                        "5eb87d13ffd86e000604b360",
                        "5eb87d26ffd86e000604b371",
                        "5eb87d2dffd86e000604b376",
                        "5eb87d35ffd86e000604b37a",
                        "5eb87d36ffd86e000604b37b",
                        "5eb87d42ffd86e000604b384",
                        "5eb87d47ffd86e000604b38a",
                        "5f8399fb818d8b59f5740d43",
                        "600f9b6d8f798e2a4d5f979f",
                        "61bf3e31cd5ab50b0d936345",
                        "6161d32d6db1a92bfba85359",
                        "6243ae24af52800c6e919258"
                    ],
                    "id": "5e9e3032383ecb267a34e7c7"
                },
                {
                    "images": {
                        "large": [
                            "https://i.imgur.com/YE8PMYX.png"
                        ]
                    },
                    "name": "LZ-2",
                    "full_name": "Landing Zone 2",
                    "status": "active",
                    "type": "RTLS",
                    "locality": "Cape Canaveral",
                    "region": "Florida",
                    "latitude": 28.485833,
                    "longitude": -80.544444,
                    "landing_attempts": 3,
                    "landing_successes": 3,
                    "wikipedia": "https://en.wikipedia.org/wiki/Landing_Zones_1_and_2",
                    "details": "SpaceX's first east coast landing pad is Landing Zone 1, where the historic first Falcon 9 landing occurred in December 2015. LC-13 was originally used as a launch pad for early Atlas missiles and rockets from Lockheed Martin. LC-1 was later expanded to include Landing Zone 2 for side booster RTLS Falcon Heavy missions, and it was first used in February 2018 for that purpose.",
                    "launches": [
                        "5eb87d13ffd86e000604b360",
                        "5eb87d2dffd86e000604b376",
                        "5eb87d35ffd86e000604b37a"
                    ],
                    "id": "5e9e3032383ecb90a834e7c8"
                },
                {
                    "images": {
                        "large": [
                            "https://i.imgur.com/647XbH6.png"
                        ]
                    },
                    "name": "LZ-4",
                    "full_name": "Landing Zone 4",
                    "status": "active",
                    "type": "RTLS",
                    "locality": "Vandenberg Air Force Base",
                    "region": "California",
                    "latitude": 34.632989,
                    "longitude": -120.615167,
                    "landing_attempts": 6,
                    "landing_successes": 6,
                    "wikipedia": "https://en.wikipedia.org/wiki/Vandenberg_AFB_Space_Launch_Complex_4#LZ-4_landing_history",
                    "details": "SpaceX's west coast landing pad. The pad is adjacent to SLC-4E, SpaceX's west coast launch site. The pad was under construction for about a year starting in 2016. After concerns with seal mating season, this pad was first used for the SAOCOM 1A mission in October 2018. Officially referred to as LZ-4 in FCC filings.",
                    "launches": [
                        "5eb87d23ffd86e000604b36e",
                        "5eb87d31ffd86e000604b379",
                        "5ed983aa1f30554030d45c31",
                        "607a34e35a906a44023e085e",
                        "6243adcaaf52800c6e919254",
                        "5fe3af43b3467846b324215e"
                    ],
                    "id": "5e9e3032383ecb554034e7c9"
                },
                {
                    "images": {
                        "large": [
                            "https://i.imgur.com/rbpkg01.png"
                        ]
                    },
                    "name": "OCISLY",
                    "full_name": "Of Course I Still Love You",
                    "status": "active",
                    "type": "ASDS",
                    "locality": "Port of Los Angeles",
                    "region": "California",
                    "latitude": 33.7291858,
                    "longitude": -118.262015,
                    "landing_attempts": 61,
                    "landing_successes": 54,
                    "wikipedia": "https://en.wikipedia.org/wiki/Autonomous_spaceport_drone_ship",
                    "details": "The second ASDS barge, Of Course I Still Love You (OCISLY), had been under construction in a Louisiana shipyard since early 2015 using a different hull—Marmac 304—in order to service launches on the east coast. It was built as a replacement for the first Just Read the Instructions and entered operational service for Falcon 9 Flight 19 in late June 2015. As of June 2015, its home port was Jacksonville, Florida, but after December 2015, it was transferred 160 miles (260 km) further south, at Port Canaveral. While the dimensions of the ship are nearly identical to the first ASDS, several enhancements were made including a steel blast wall erected between the aft containers and the landing deck. The ship was in place for a first-stage landing test on the CRS-7 mission, which failed on launch on 28 June 2015. On 8 April 2016 the first stage, which launched the Dragon CRS-8 spacecraft, successfully landed for the first time ever on OCISLY, which is also the first ever drone ship landing. In February 2018, the Falcon Heavy Test Flight's central core exploded upon impact next to OCISLY that damaged two of the four thrusters on the drone ship. Two thrusters were removed from the Marmac 303 barge in order to repair OCISLY.",
                    "launches": [
                        "5eb87ceeffd86e000604b341",
                        "5eb87cf2ffd86e000604b344",
                        "5eb87cf3ffd86e000604b345",
                        "5eb87cf5ffd86e000604b346",
                        "5eb87cf6ffd86e000604b347",
                        "5eb87cf8ffd86e000604b348",
                        "5eb87cfaffd86e000604b34a",
                        "5eb87cfbffd86e000604b34b",
                        "5eb87d00ffd86e000604b34f",
                        "5eb87d04ffd86e000604b353",
                        "5eb87d0cffd86e000604b35a",
                        "5eb87d0dffd86e000604b35b",
                        "5eb87d13ffd86e000604b360",
                        "5eb87d18ffd86e000604b365",
                        "5eb87d19ffd86e000604b366",
                        "5eb87d1effd86e000604b36a",
                        "5eb87d20ffd86e000604b36c",
                        "5eb87d22ffd86e000604b36d",
                        "5eb87d24ffd86e000604b36f",
                        "5eb87d2affd86e000604b374",
                        "5eb87d2bffd86e000604b375",
                        "5eb87d2dffd86e000604b376",
                        "5eb87d2effd86e000604b377",
                        "5eb87d30ffd86e000604b378",
                        "5eb87d35ffd86e000604b37a",
                        "5eb87d39ffd86e000604b37d",
                        "5eb87d39ffd86e000604b37e",
                        "5eb87d3bffd86e000604b37f",
                        "5eb87d3cffd86e000604b380",
                        "5eb87d3fffd86e000604b382",
                        "5eb87d41ffd86e000604b383",
                        "5eb87d43ffd86e000604b385",
                        "5eb87d44ffd86e000604b386",
                        "5eb87d46ffd86e000604b388",
                        "5eb87d46ffd86e000604b389",
                        "5ed9819a1f30554030d45c29",
                        "5ed981d91f30554030d45c2a",
                        "5ef6a1e90059c33cee4a828a",
                        "5ef6a2090059c33cee4a828b",
                        "5ef6a2bf0059c33cee4a828c",
                        "5eb87d4cffd86e000604b38d",
                        "5fb95b3f3a88ae63c954603c",
                        "5eb87d4effd86e000604b391",
                        "5fd386aa7faea57d297c86c1",
                        "5ff6554f9257f579ee3a6c5f",
                        "600f9a5e8f798e2a4d5f979c",
                        "5fbfecfe54ceb10a5664c80b",
                        "600f9a8d8f798e2a4d5f979e",
                        "60428aafc041c16716f73cd7",
                        "60428ac4c041c16716f73cd8",
                        "5fe3af58b3467846b324215f",
                        "605b4b7daa5433645e37d040",
                        "6079bd1c9a06446e8c61bf76",
                        "605b4b95aa5433645e37d041",
                        "5fe3af84b3467846b3242161",
                        "60e3bf0d73359e1e20335c37",
                        "5fe3b107b3467846b324216b",
                        "61bba806437241381bf7061e",
                        "61fc0203e0dc5662b76489a8",
                        "6258290d5988f159024b9644",
                        "62a9f0e320413d2695d88713",
                        "62a9f10b20413d2695d88715",
                        "62f3b4ff0f55c50e192a4e6b",
                        "62f3b53a0f55c50e192a4e6f"
                    ],
                    "id": "5e9e3032383ecb6bb234e7ca"
                },
                {
                    "images": {
                        "large": [
                            "https://i.imgur.com/gZUJ04V.png"
                        ]
                    },
                    "name": "JRTI-1",
                    "full_name": "Just Read The Instructions V1",
                    "status": "retired",
                    "type": "ASDS",
                    "locality": "Port Canaveral",
                    "region": "Florida",
                    "latitude": 28.4104,
                    "longitude": -80.6188,
                    "landing_attempts": 2,
                    "landing_successes": 0,
                    "wikipedia": "https://en.wikipedia.org/wiki/Autonomous_spaceport_drone_ship",
                    "details": "The ASDS landing location for the first landing test was in the Atlantic approximately 200 miles (320 km) northeast of the launch location at Cape Canaveral, and 165 miles (266 km) southeast of Charleston, South Carolina. SpaceX's Just Read the Instructions, based on the Marmac 300 deck barge, in position for a landing test on Falcon 9 Flight 17 in April 2015. On 23 January 2015, during repairs to the ship following the unsuccessful first test, Musk announced that the ship was to be named Just Read the Instructions, with a sister ship planned for west coast launches to be named Of Course I Still Love You. On 29 January, SpaceX released a manipulated photo of the ship with the name illustrating how it would look once painted. Both ships are named after two General Contact Units, spaceships commanded by autonomous artificial intelligences, that appear in The Player of Games, a Culture novel by Iain M. Banks. The first Just Read the Instructions was retired in May 2015 after approximately six months of service in the Atlantic, and its duties were assumed by Of Course I Still Love You. The former ASDS was modified by removing the wing extensions that had extended the barge surface and the equipment (thrusters, cameras and communications gear) that had been added to refit it as an ASDS; these items were saved for future reuse.",
                    "launches": [
                        "5eb87ce8ffd86e000604b33c",
                        "5eb87cecffd86e000604b33f"
                    ],
                    "id": "5e9e3032383ecb761634e7cb"
                }
            ],
            "totalDocs": 7,
            "offset": 0,
            "limit": 5,
            "totalPages": 2,
            "page": 1,
            "pagingCounter": 1,
            "hasPrevPage": false,
            "hasNextPage": true,
            "prevPage": null,
            "nextPage": 2
        }
        """.data(using: .utf8)!
    }
}
