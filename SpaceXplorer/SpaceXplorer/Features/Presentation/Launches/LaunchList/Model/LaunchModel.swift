//
//  LaunchModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

struct LaunchModel {
    let id: String
    let name: String
    let dateUTC: String
    let details: String?
    let links: LaunchLinksModel
    let isUpcoming: Bool
    
    init(from entity: LaunchEntity) {
        self.id = entity.id
        self.name = entity.name
        self.dateUTC = ISO8601DateFormatter().string(from: entity.date)
        self.details = entity.details
        self.links = LaunchLinksModel(
            patch: LaunchLinksModel.PatchModel(
                small: entity.links.patchSmall,
                large: entity.links.patchLarge
            ),
            flickr: LaunchLinksModel.FlickrImagesModel(
                original: entity.links.flickrImages
            ),
            webcast: entity.links.webcastURL,
            wikipedia: entity.links.wikipediaURL
        )
        self.isUpcoming = entity.isUpcoming
    }
}

struct LaunchLinksModel {
    let patch: PatchModel?
    let flickr: FlickrImagesModel?
    let webcast: String?
    let wikipedia: String?
    
    struct PatchModel {
        let small: String?
        let large: String?
    }
    
    struct FlickrImagesModel {
        let original: [String]?
    }
}
