//
//  LaunchLinksDecodable.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

struct LaunchLinksDecodable: Decodable {
    let patch: PatchDecodable?
    let flickr: FlickrImagesDecodable?
    let webcast: String?
    let wikipedia: String?

    enum CodingKeys: String, CodingKey {
        case patch
        case flickr
        case webcast
        case wikipedia
    }
    
    struct PatchDecodable: Decodable {
        let small: String?
        let large: String?

        enum CodingKeys: String, CodingKey {
            case small
            case large
        }
    }
    
    struct FlickrImagesDecodable: Decodable {
        let original: [String]?

        enum CodingKeys: String, CodingKey {
            case original
        }
    }
}
