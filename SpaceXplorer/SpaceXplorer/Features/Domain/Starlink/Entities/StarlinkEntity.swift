//
//  StarlinkEntity.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 26/12/24.
//

import Foundation

struct StarlinkEntity {
    let id: String
    let name: String
    let launchDate: Date?
    let latitude: Double?
    let longitude: Double?
    let heightKM: Double?
    let velocityKMS: Double?
    let version: String?

    init(from decodable: StarlinkDecodable) throws {
        self.id = decodable.id
        self.name = decodable.spaceTrack?.objectName ?? ""

        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        
        if let launchDateString = decodable.spaceTrack?.launchDate {
            if let date = formatter.date(from: launchDateString) {
                self.launchDate = date
            } else {
                self.launchDate = nil
            }
        } else {
            self.launchDate = nil
        }
        
        self.latitude = decodable.latitude
        self.longitude = decodable.longitude
        self.heightKM = decodable.heightKM
        self.velocityKMS = decodable.velocityKMS
        self.version = decodable.version
    }
}
