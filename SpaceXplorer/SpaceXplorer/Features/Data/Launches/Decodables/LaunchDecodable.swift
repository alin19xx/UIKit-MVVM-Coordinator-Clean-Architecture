//
//  LaunchDecodable.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

struct LaunchDecodable: Decodable {
    let id: String
    let name: String
    let dateUTC: String
    let details: String?
    let links: LaunchLinksDecodable
    let success: Bool?
    let upcoming: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case dateUTC = "date_utc"
        case details
        case links
        case success
        case upcoming
    }
}
