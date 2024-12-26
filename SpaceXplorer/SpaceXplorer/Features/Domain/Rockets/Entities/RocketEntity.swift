//
//  RocketEntity.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 19/12/24.
//

import Foundation

struct RocketEntity {
    let id: String
    let name: String
    let description: String
    let height: DimensionEntity
    let diameter: DimensionEntity
    let mass: MassEntity
    let firstStage: StageEntity
    let secondStage: StageEntity
    let engines: EngineEntity
    let landingLegs: LandingLegsEntity
    let payloadWeights: [PayloadWeightEntity]
    let flickrImages: [String]
    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLaunch: Int
    let successRatePct: Int
    let firstFlight: Date
    let country: String
    let company: String
    let wikipedia: URL
}

struct DimensionEntity {
    let meters: Double?
    let feet: Double?
}

struct MassEntity {
    let kg: Int?
    let lb: Int?
}

struct StageEntity {
    let thrustSeaLevel: ThrustEntity?
    let thrustVacuum: ThrustEntity?
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?
    let payloads: PayloadsEntity?
}

struct ThrustEntity {
    let kN: Double?
    let lbf: Int?
}

struct PayloadsEntity {
    let compositeFairing: CompositeFairingEntity?
    let option1: String?
}

struct CompositeFairingEntity {
    let height: DimensionEntity?
    let diameter: DimensionEntity?
}

struct EngineEntity {
    let isp: ISPEntity
    let thrustSeaLevel: ThrustEntity?
    let thrustVacuum: ThrustEntity?
    let number: Int
    let type: String
    let version: String
    let layout: String?
    let engineLossMax: Int?
    let propellant1: String
    let propellant2: String
    let thrustToWeight: Double
}

struct ISPEntity {
    let seaLevel: Int
    let vacuum: Int
}

struct LandingLegsEntity {
    let number: Int
    let material: String?
}

struct PayloadWeightEntity {
    let id: String
    let name: String
    let kg: Int
    let lb: Int
}

extension RocketEntity {
    init(from decodable: RocketDecodable) {
        self.id = decodable.id
        self.name = decodable.name
        self.description = decodable.description
        self.height = DimensionEntity(meters: decodable.height.meters, feet: decodable.height.feet)
        self.diameter = DimensionEntity(meters: decodable.diameter.meters, feet: decodable.diameter.feet)
        self.mass = MassEntity(kg: decodable.mass.kg, lb: decodable.mass.lb)
        self.firstStage = StageEntity(from: decodable.firstStage)
        self.secondStage = StageEntity(from: decodable.secondStage)
        self.engines = EngineEntity(from: decodable.engines)
        self.landingLegs = LandingLegsEntity(from: decodable.landingLegs)
        self.payloadWeights = decodable.payloadWeights.map { PayloadWeightEntity(from: $0) }
        self.flickrImages = decodable.flickrImages
        self.active = decodable.active
        self.stages = decodable.stages
        self.boosters = decodable.boosters
        self.costPerLaunch = decodable.costPerLaunch
        self.successRatePct = decodable.successRatePct
        self.firstFlight = ISO8601DateFormatter().date(from: decodable.firstFlight) ?? Date()
        self.country = decodable.country
        self.company = decodable.company
        self.wikipedia = URL(string: decodable.wikipedia) ?? URL(string: "https://www.spacex.com")!
    }
}

extension StageEntity {
    init(from decodable: StageDecodable) {
        self.thrustSeaLevel = decodable.thrustSeaLevel.map { ThrustEntity(from: $0) }
        self.thrustVacuum = decodable.thrustVacuum.map { ThrustEntity(from: $0) }
        self.reusable = decodable.reusable
        self.engines = decodable.engines
        self.fuelAmountTons = decodable.fuelAmountTons
        self.burnTimeSec = decodable.burnTimeSec
        self.payloads = decodable.payloads.map { PayloadsEntity(from: $0) }
    }
}

extension ThrustEntity {
    init(from decodable: ThrustDecodable) {
        self.kN = decodable.kN
        self.lbf = decodable.lbf
    }
}

extension PayloadsEntity {
    init(from decodable: PayloadsDecodable) {
        self.compositeFairing = CompositeFairingEntity(from: decodable.compositeFairing)
        self.option1 = decodable.option1
    }
}

extension CompositeFairingEntity {
    init(from decodable: CompositeFairingDecodable) {
        self.height = decodable.height.map { DimensionEntity(meters: $0.meters, feet: $0.feet) }
        self.diameter = decodable.diameter.map { DimensionEntity(meters: $0.meters, feet: $0.feet) }
    }
}

extension EngineEntity {
    init(from decodable: EngineDecodable) {
        self.isp = ISPEntity(from: decodable.isp)
        self.thrustSeaLevel = decodable.thrustSeaLevel.map { ThrustEntity(from: $0) }
        self.thrustVacuum = decodable.thrustVacuum.map { ThrustEntity(from: $0) }
        self.number = decodable.number
        self.type = decodable.type
        self.version = decodable.version
        self.layout = decodable.layout
        self.engineLossMax = decodable.engineLossMax
        self.propellant1 = decodable.propellant1
        self.propellant2 = decodable.propellant2
        self.thrustToWeight = decodable.thrustToWeight
    }
}

extension ISPEntity {
    init(from decodable: ISPDecodable) {
        self.seaLevel = decodable.seaLevel
        self.vacuum = decodable.vacuum
    }
}

extension LandingLegsEntity {
    init(from decodable: LandingLegsDecodable) {
        self.number = decodable.number
        self.material = decodable.material
    }
}

extension PayloadWeightEntity {
    init(from decodable: PayloadWeightDecodable) {
        self.id = decodable.id
        self.name = decodable.name
        self.kg = decodable.kg
        self.lb = decodable.lb
    }
}
