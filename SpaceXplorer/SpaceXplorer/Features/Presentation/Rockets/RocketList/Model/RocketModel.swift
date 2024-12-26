//
//  RocketModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 19/12/24.
//

import Foundation

struct RocketModel {
    let id: String
    let name: String
    let description: String
    let height: String
    let diameter: String
    let mass: String
    let images: [String]
    let activeStatus: String
    let firstFlight: String
    let country: String
    let company: String
    let costPerLaunch: String
    let successRate: String
    let stages: Int
    let boosters: Int
    let firstStage: StageModel
    let secondStage: StageModel
    let engines: EngineModel
    let landingLegs: LandingLegsModel
    let payloadWeights: [PayloadWeightModel]
}

extension RocketModel {
    init(from entity: RocketEntity) {
        self.id = entity.id
        self.name = entity.name
        self.description = entity.description
        self.height = "\(entity.height.meters ?? 0) m / \(entity.height.feet ?? 0) ft"
        self.diameter = "\(entity.diameter.meters ?? 0) m / \(entity.diameter.feet ?? 0) ft"
        self.mass = "\(entity.mass.kg ?? 0) kg / \(entity.mass.lb ?? 0) lb"
        self.images = entity.flickrImages
        self.activeStatus = entity.active ? "Active" : "Inactive"
        self.firstFlight = DateFormatter.localizedString(
            from: entity.firstFlight,
            dateStyle: .medium,
            timeStyle: .none
        )
        self.country = entity.country
        self.company = entity.company
        self.costPerLaunch = "$\(entity.costPerLaunch)"
        self.successRate = "\(entity.successRatePct)%"
        self.stages = entity.stages
        self.boosters = entity.boosters
        self.firstStage = StageModel(from: entity.firstStage)
        self.secondStage = StageModel(from: entity.secondStage)
        self.engines = EngineModel(from: entity.engines)
        self.landingLegs = LandingLegsModel(from: entity.landingLegs)
        self.payloadWeights = entity.payloadWeights.map { PayloadWeightModel(from: $0) }
    }
}

struct StageModel {
    let thrustSeaLevel: ThrustModel?
    let thrustVacuum: ThrustModel?
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?
}

extension StageModel {
    init(from entity: StageEntity) {
        self.thrustSeaLevel = entity.thrustSeaLevel.map { ThrustModel(from: $0) }
        self.thrustVacuum = entity.thrustVacuum.map { ThrustModel(from: $0) }
        self.reusable = entity.reusable
        self.engines = entity.engines
        self.fuelAmountTons = entity.fuelAmountTons
        self.burnTimeSec = entity.burnTimeSec
    }
}

struct ThrustModel {
    let kN: Double?
    let lbf: Int?
}

extension ThrustModel {
    init(from entity: ThrustEntity) {
        self.kN = entity.kN
        self.lbf = entity.lbf
    }
}

struct EngineModel {
    let ispSeaLevel: Int
    let ispVacuum: Int
    let thrustSeaLevel: ThrustModel?
    let thrustVacuum: ThrustModel?
    let number: Int
    let type: String
    let version: String
    let layout: String?
    let engineLossMax: Int?
    let propellant1: String
    let propellant2: String
    let thrustToWeight: Double
}

extension EngineModel {
    init(from entity: EngineEntity) {
        self.ispSeaLevel = entity.isp.seaLevel
        self.ispVacuum = entity.isp.vacuum
        self.thrustSeaLevel = entity.thrustSeaLevel.map { ThrustModel(from: $0) }
        self.thrustVacuum = entity.thrustVacuum.map { ThrustModel(from: $0) }
        self.number = entity.number
        self.type = entity.type
        self.version = entity.version
        self.layout = entity.layout
        self.engineLossMax = entity.engineLossMax
        self.propellant1 = entity.propellant1
        self.propellant2 = entity.propellant2
        self.thrustToWeight = entity.thrustToWeight
    }
}

struct LandingLegsModel {
    let number: Int
    let material: String?
}

extension LandingLegsModel {
    init(from entity: LandingLegsEntity) {
        self.number = entity.number
        self.material = entity.material
    }
}

struct PayloadWeightModel {
    let id: String
    let name: String
    let kg: Int
    let lb: Int
}


extension PayloadWeightModel {
    init(from entity: PayloadWeightEntity) {
        self.id = entity.id
        self.name = entity.name
        self.kg = entity.kg
        self.lb = entity.lb
    }
}
