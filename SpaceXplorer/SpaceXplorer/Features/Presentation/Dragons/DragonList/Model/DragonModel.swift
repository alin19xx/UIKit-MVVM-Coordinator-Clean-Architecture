//
//  DragonModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation

struct DragonModel {
    let id: String
    let name: String
    let type: String
    let description: String
    let crewCapacity: String
    let flickrImages: [String]
    let firstFlight: String
    let heatShield: HeatShieldModel
    let launchPayloadMass: String
    let launchPayloadVol: String
    let returnPayloadMass: String
    let returnPayloadVol: String
    let pressurizedCapsuleVolume: String
    let trunkVolume: String
    let cargo: CargoModel
    let heightWithTrunk: String
    let diameter: String
    let dryMass: String
    let thrusters: [ThrusterModel]
    let wikipedia: URL
    let activeStatus: String
}

struct HeatShieldModel {
    let material: String
    let size: String
    let tempDegrees: String
    let devPartner: String
}

struct CargoModel {
    let solarArray: String
    let unpressurizedCargo: String
}

struct ThrusterModel {
    let type: String
    let amount: String
    let pods: String
    let fuel1: String
    let fuel2: String
    let isp: String
    let thrust: String
}

extension DragonModel {
    init(from entity: DragonEntity) {
        self.id = entity.id
        self.name = entity.name
        self.type = entity.type
        self.description = entity.description
        self.crewCapacity = "\(entity.crewCapacity) crew members"
        self.flickrImages = entity.flickrImages
        self.firstFlight = DateFormatter.localizedString(
            from: entity.firstFlight,
            dateStyle: .medium,
            timeStyle: .none
        )
        self.heatShield = HeatShieldModel(from: entity.heatShield)
        self.launchPayloadMass = "\(entity.launchPayloadMass.kg ?? 0) kg / \(entity.launchPayloadMass.lb ?? 0) lb"
        self.launchPayloadVol = "\(entity.launchPayloadVol.cubicMeters) m³ / \(entity.launchPayloadVol.cubicFeet) ft³"
        self.returnPayloadMass = "\(entity.returnPayloadMass.kg ?? 0) kg / \(entity.returnPayloadMass.lb ?? 0) lb"
        self.returnPayloadVol = "\(entity.returnPayloadVol.cubicMeters) m³ / \(entity.returnPayloadVol.cubicFeet) ft³"
        self.pressurizedCapsuleVolume = "\(entity.pressurizedCapsule.payloadVolume.cubicMeters) m³ / \(entity.pressurizedCapsule.payloadVolume.cubicFeet) ft³"
        self.trunkVolume = "\(entity.trunk.trunkVolume.cubicMeters) m³ / \(entity.trunk.trunkVolume.cubicFeet) ft³"
        self.cargo = CargoModel(from: entity.trunk.cargo)
        self.heightWithTrunk = "\(entity.heightWithTrunk.meters ?? 0.0) m / \(entity.heightWithTrunk.feet ?? 0.0) ft"
        self.diameter = "\(entity.diameter.meters ?? 0.0) m / \(entity.diameter.feet ?? 0.0) ft"
        self.dryMass = "\(entity.dryMass) kg "
        self.thrusters = entity.thrusters.map { ThrusterModel(from: $0) }
        self.wikipedia = entity.wikipedia
        self.activeStatus = entity.active ? "Active" : "Inactive"
    }
}

extension HeatShieldModel {
    init(from entity: HeatShieldEntity) {
        self.material = entity.material
        self.size = "\(entity.sizeMeters) meters"
        self.tempDegrees = "\(entity.tempDegrees)°C"
        self.devPartner = entity.devPartner
    }
}

extension CargoModel {
    init(from entity: CargoEntity) {
        self.solarArray = "\(entity.solarArray) solar arrays"
        self.unpressurizedCargo = entity.unpressurizedCargo ? "Yes" : "No"
    }
}

extension ThrusterModel {
    init(from entity: ThrusterEntity) {
        self.type = entity.type
        self.amount = "\(entity.amount)"
        self.pods = "\(entity.pods)"
        self.fuel1 = entity.fuel1
        self.fuel2 = entity.fuel2
        self.isp = "\(entity.isp) seconds"
        self.thrust = "\(entity.thrust.kN ?? 0) kN / \(entity.thrust.lbf ?? 0) lbf"
    }
}
