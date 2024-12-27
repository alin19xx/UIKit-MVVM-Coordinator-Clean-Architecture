//
//  StarlinkDecodable.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 26/12/24.
//

import Foundation

struct StarlinkDecodable: Decodable {
    let id: String
    let spaceTrack: SpaceTrack?
    let latitude: Double?
    let longitude: Double?
    let heightKM: Double?
    let velocityKMS: Double?
    let version: String?

    struct SpaceTrack: Decodable {
        let objectName: String?
        let launchDate: String?
    }
}
