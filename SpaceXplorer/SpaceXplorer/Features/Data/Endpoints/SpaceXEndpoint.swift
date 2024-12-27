//
//  SpaceXEndpoint.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

enum SpaceXEndpoint: Endpoint {
    case launches(limit: Int?, offset: Int?)
    case rockets
    case landpads(limit: Int?, offset: Int?)
    case starlink

    var path: String {
        switch self {
        case .launches: return "/v4/launches/query"
        case .rockets: return "/v4/rockets"
        case .landpads: return "/v4/landpads/query"
        case .starlink: return "/v4/starlink"
        }
    }

    var method: HttpMethod {
        switch self {
            case .launches, .landpads:
                return .post
            case .starlink, .rockets:
                return .get
        }
    }

    var queryItems: [URLQueryItem] { [] }

    var bodyParameters: Data? {
        switch self {
        case .launches(let limit, let offset),
             .landpads(let limit, let offset):
            let requestBody = [
                "query": [:],
                "options": [
                    "limit": limit ?? 10,
                    "offset": offset ?? 0
                ]
            ]
            return try? JSONSerialization.data(withJSONObject: requestBody)

        case .starlink, .rockets:
            return nil
        }
    }
}
