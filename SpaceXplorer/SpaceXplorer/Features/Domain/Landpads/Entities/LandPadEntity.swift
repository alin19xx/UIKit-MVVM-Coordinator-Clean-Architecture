//
//  LandPadEntity.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation

struct LandPadEntity {
    let id: String
    let name: String
    let fullName: String
    let status: String
    let type: String
    let locality: String
    let region: String
    let latitude: Double
    let longitude: Double
    let landingAttempts: Int
    let landingSuccesses: Int
    let wikipedia: URL
    let details: String
    let images: [String]
    let launches: [String]
}

extension LandPadEntity {
    init(from decodable: LandPadDecodable) {
        self.id = decodable.id
        self.name = decodable.name
        self.fullName = decodable.fullName
        self.status = decodable.status
        self.type = decodable.type
        self.locality = decodable.locality
        self.region = decodable.region
        self.latitude = decodable.latitude
        self.longitude = decodable.longitude
        self.landingAttempts = decodable.landingAttempts
        self.landingSuccesses = decodable.landingSuccesses
        self.wikipedia = URL(string: decodable.wikipedia) ?? URL(string: "https://www.spacex.com")!
        self.details = decodable.details
        self.images = decodable.images.large
        self.launches = decodable.launches
    }
}
