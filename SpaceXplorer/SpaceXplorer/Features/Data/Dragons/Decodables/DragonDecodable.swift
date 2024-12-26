//
//  DragonDecodable.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

struct DragonDecodable: Decodable {
    let id: String
    let name: String
    let type: String
    let description: String
    let crewCapacity: Int
    let flickrImages: [String]
    let firstFlight: String
    let heatShield: HeatShieldDecodable
    let launchPayloadMass: MassDecodable
    let launchPayloadVol: VolumeDecodable
    let returnPayloadMass: MassDecodable
    let returnPayloadVol: VolumeDecodable
    let pressurizedCapsule: PressurizedCapsuleDecodable
    let trunk: TrunkDecodable
    let heightWithTrunk: DimensionDecodable
    let diameter: DimensionDecodable
    let dryMass: Int
    let thrusters: [ThrusterDecodable]
    let wikipedia: String
    let active: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, type, description, active
        case crewCapacity = "crew_capacity"
        case flickrImages = "flickr_images"
        case firstFlight = "first_flight"
        case heatShield = "heat_shield"
        case launchPayloadMass = "launch_payload_mass"
        case launchPayloadVol = "launch_payload_vol"
        case returnPayloadMass = "return_payload_mass"
        case returnPayloadVol = "return_payload_vol"
        case pressurizedCapsule = "pressurized_capsule"
        case trunk
        case heightWithTrunk = "height_w_trunk"
        case diameter
        case dryMass = "dry_mass_kg"
        case thrusters
        case wikipedia
    }
}

struct HeatShieldDecodable: Decodable {
    let material: String
    let sizeMeters: Double
    let tempDegrees: Int
    let devPartner: String
    
    enum CodingKeys: String, CodingKey {
        case material
        case sizeMeters = "size_meters"
        case tempDegrees = "temp_degrees"
        case devPartner = "dev_partner"
    }
}

struct MassDecodable: Decodable {
    let kg: Int
    let lb: Int
}

struct VolumeDecodable: Decodable {
    let cubicMeters: Int
    let cubicFeet: Int
    
    enum CodingKeys: String, CodingKey {
        case cubicMeters = "cubic_meters"
        case cubicFeet = "cubic_feet"
    }
}

struct PressurizedCapsuleDecodable: Decodable {
    let payloadVolume: VolumeDecodable
    
    enum CodingKeys: String, CodingKey {
        case payloadVolume = "payload_volume"
    }
}

struct TrunkDecodable: Decodable {
    let trunkVolume: VolumeDecodable
    let cargo: CargoDecodable
    
    enum CodingKeys: String, CodingKey {
        case trunkVolume = "trunk_volume"
        case cargo
    }
}

struct CargoDecodable: Decodable {
    let solarArray: Int
    let unpressurizedCargo: Bool
    
    enum CodingKeys: String, CodingKey {
        case solarArray = "solar_array"
        case unpressurizedCargo = "unpressurized_cargo"
    }
}

struct ThrusterDecodable: Decodable {
    let type: String
    let amount: Int
    let pods: Int
    let fuel1: String
    let fuel2: String
    let isp: Int
    let thrust: ThrustDecodable
    
    enum CodingKeys: String, CodingKey {
        case type, amount, pods, isp, thrust
        case fuel1 = "fuel_1"
        case fuel2 = "fuel_2"
    }
}
