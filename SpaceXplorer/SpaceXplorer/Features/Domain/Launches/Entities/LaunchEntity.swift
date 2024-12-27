//
//  LaunchEntity.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 18/12/24.
//

import Foundation

struct LaunchEntity {
    let id: String
    let name: String
    let date: Date
    let details: String?
    let links: LaunchLinksEntity
    let isUpcoming: Bool
    let isSuccess: Bool?

    struct LaunchLinksEntity {
        let patchSmall: String?
        let patchLarge: String?
        let flickrImages: [String]?
        let webcastURL: String?
        let wikipediaURL: String?
    }

    init(from decodable: LaunchDecodable) {
        self.id = decodable.id
        self.name = decodable.name
        self.date = LaunchEntity.parseDate(decodable.dateUTC) ?? .now
        self.details = decodable.details
        self.links = LaunchLinksEntity(
            patchSmall: decodable.links.patch?.small,
            patchLarge: decodable.links.patch?.large,
            flickrImages: decodable.links.flickr?.original,
            webcastURL: decodable.links.webcast,
            wikipediaURL: decodable.links.wikipedia
        )
        self.isUpcoming = decodable.upcoming ?? false
        self.isSuccess = decodable.success
    }

    private static func parseDate(_ dateString: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        if let date = formatter.date(from: dateString) {
            return date
        }
        formatter.formatOptions = [.withInternetDateTime]
        return formatter.date(from: dateString)
    }
}
