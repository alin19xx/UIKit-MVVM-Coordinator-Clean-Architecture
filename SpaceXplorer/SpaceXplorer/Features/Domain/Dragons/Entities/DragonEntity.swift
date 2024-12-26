//
//  DragonEntity.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation

struct DragonEntity {
    let id: String
    let name: String
    let type: String
    let description: String
    let crewCapacity: Int
    let flickrImages: [String]
    let firstFlight: Date
    let heatShield: HeatShieldEntity
    let launchPayloadMass: MassEntity
    let launchPayloadVol: VolumeEntity
    let returnPayloadMass: MassEntity
    let returnPayloadVol: VolumeEntity
    let pressurizedCapsule: PressurizedCapsuleEntity
    let trunk: TrunkEntity
    let heightWithTrunk: DimensionEntity
    let diameter: DimensionEntity
    let dryMass: Int
    let thrusters: [ThrusterEntity]
    let wikipedia: URL
    let active: Bool
}

struct HeatShieldEntity {
    let material: String
    let sizeMeters: Double
    let tempDegrees: Int
    let devPartner: String
}

struct VolumeEntity {
    let cubicMeters: Int
    let cubicFeet: Int
}

struct PressurizedCapsuleEntity {
    let payloadVolume: VolumeEntity
}

struct TrunkEntity {
    let trunkVolume: VolumeEntity
    let cargo: CargoEntity
}

struct CargoEntity {
    let solarArray: Int
    let unpressurizedCargo: Bool
}

struct ThrusterEntity {
    let type: String
    let amount: Int
    let pods: Int
    let fuel1: String
    let fuel2: String
    let isp: Int
    let thrust: ThrustEntity
}

extension DragonEntity {
    init(from decodable: DragonDecodable) {
        self.id = decodable.id
        self.name = decodable.name
        self.type = decodable.type
        self.description = decodable.description
        self.crewCapacity = decodable.crewCapacity
        self.flickrImages = decodable.flickrImages
        self.firstFlight = ISO8601DateFormatter().date(from: decodable.firstFlight) ?? Date()
        self.heatShield = HeatShieldEntity(from: decodable.heatShield)
        self.launchPayloadMass = MassEntity(from: decodable.launchPayloadMass)
        self.launchPayloadVol = VolumeEntity(from: decodable.launchPayloadVol)
        self.returnPayloadMass = MassEntity(from: decodable.returnPayloadMass)
        self.returnPayloadVol = VolumeEntity(from: decodable.returnPayloadVol)
        self.pressurizedCapsule = PressurizedCapsuleEntity(from: decodable.pressurizedCapsule)
        self.trunk = TrunkEntity(from: decodable.trunk)
        self.heightWithTrunk = DimensionEntity(from: decodable.heightWithTrunk)
        self.diameter = DimensionEntity(from: decodable.diameter)
        self.dryMass = decodable.dryMass
        self.thrusters = decodable.thrusters.map { ThrusterEntity(from: $0) }
        self.wikipedia = URL(string: decodable.wikipedia) ?? URL(string: "https://www.spacex.com")!
        self.active = decodable.active
    }
}

extension HeatShieldEntity {
    init(from decodable: HeatShieldDecodable) {
        self.material = decodable.material
        self.sizeMeters = decodable.sizeMeters
        self.tempDegrees = decodable.tempDegrees
        self.devPartner = decodable.devPartner
    }
}

extension MassEntity {
    init(from decodable: MassDecodable) {
        self.kg = decodable.kg
        self.lb = decodable.lb
    }
}

extension VolumeEntity {
    init(from decodable: VolumeDecodable) {
        self.cubicMeters = decodable.cubicMeters
        self.cubicFeet = decodable.cubicFeet
    }
}

extension PressurizedCapsuleEntity {
    init(from decodable: PressurizedCapsuleDecodable) {
        self.payloadVolume = VolumeEntity(from: decodable.payloadVolume)
    }
}

extension TrunkEntity {
    init(from decodable: TrunkDecodable) {
        self.trunkVolume = VolumeEntity(from: decodable.trunkVolume)
        self.cargo = CargoEntity(from: decodable.cargo)
    }
}

extension CargoEntity {
    init(from decodable: CargoDecodable) {
        self.solarArray = decodable.solarArray
        self.unpressurizedCargo = decodable.unpressurizedCargo
    }
}

extension DimensionEntity {
    init(from decodable: DimensionDecodable) {
        self.meters = decodable.meters
        self.feet = decodable.feet
    }
}

extension ThrusterEntity {
    init(from decodable: ThrusterDecodable) {
        self.type = decodable.type
        self.amount = decodable.amount
        self.pods = decodable.pods
        self.fuel1 = decodable.fuel1
        self.fuel2 = decodable.fuel2
        self.isp = decodable.isp
        self.thrust = ThrustEntity(from: decodable.thrust)
    }
}
