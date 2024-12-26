//
//  LandPadModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation

struct LandPadModel {
    let id: String
    let name: String
    let fullName: String
    let status: String
    let type: String
    let location: String
    let coordinates: String
    let landingAttempts: String
    let landingSuccesses: String
    let successRate: String
    let wikipedia: URL
    let details: String
    let images: [String]
    let launches: [String]
}

extension LandPadModel {
    init(from entity: LandPadEntity) {
        self.id = entity.id
        self.name = entity.name
        self.fullName = entity.fullName
        self.status = entity.status.capitalized
        self.type = entity.type
        self.location = "\(entity.locality), \(entity.region)"
        self.coordinates = "Lat: \(entity.latitude), Long: \(entity.longitude)"
        self.landingAttempts = "\(entity.landingAttempts) attempts"
        self.landingSuccesses = "\(entity.landingSuccesses) successes"
        
        if entity.landingAttempts > 0 {
            let rate = Double(entity.landingSuccesses) / Double(entity.landingAttempts) * 100
            self.successRate = String(format: "%.2f%% success rate", rate)
        } else {
            self.successRate = "No attempts yet"
        }
        
        self.wikipedia = entity.wikipedia
        self.details = entity.details
        self.images = entity.images
        self.launches = entity.launches
    }
}
