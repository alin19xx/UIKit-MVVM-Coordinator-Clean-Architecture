//
//  RocketDecodable.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

struct RocketDecodable: Decodable {
    let id: String
    let name: String
    let description: String
    let height: DimensionDecodable
    let diameter: DimensionDecodable
    let mass: MassDecodable
    let firstStage: StageDecodable
    let secondStage: StageDecodable
    let engines: EngineDecodable
    let landingLegs: LandingLegsDecodable
    let payloadWeights: [PayloadWeightDecodable]
    let flickrImages: [String]
    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLaunch: Int
    let successRatePct: Int
    let firstFlight: String
    let country: String
    let company: String
    let wikipedia: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case active, stages, boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, company, wikipedia
    }
}

struct DimensionDecodable: Decodable {
    let meters: Double?
    let feet: Double?
}

struct StageDecodable: Decodable {
    let thrustSeaLevel: ThrustDecodable?
    let thrustVacuum: ThrustDecodable?
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?
    let payloads: PayloadsDecodable?
    
    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
        case payloads
    }
}

struct ThrustDecodable: Decodable {
    let kN: Double?
    let lbf: Int?
}

struct PayloadsDecodable: Decodable {
    let compositeFairing: CompositeFairingDecodable
    let option1: String?
    
    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}

struct CompositeFairingDecodable: Decodable {
    let height: DimensionDecodable?
    let diameter: DimensionDecodable?
}

struct EngineDecodable: Decodable {
    let isp: ISPDecodable
    let thrustSeaLevel: ThrustDecodable?
    let thrustVacuum: ThrustDecodable?
    let number: Int
    let type: String
    let version: String
    let layout: String?
    let engineLossMax: Int?
    let propellant1: String
    let propellant2: String
    let thrustToWeight: Double
    
    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number, type, version, layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

struct ISPDecodable: Decodable {
    let seaLevel: Int
    let vacuum: Int
    
    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

struct LandingLegsDecodable: Decodable {
    let number: Int
    let material: String?
}

struct PayloadWeightDecodable: Decodable {
    let id: String
    let name: String
    let kg: Int
    let lb: Int
}

struct MassDecodable: Decodable {
    let kg: Int
    let lb: Int
}
