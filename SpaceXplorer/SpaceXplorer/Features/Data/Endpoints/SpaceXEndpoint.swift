//
//  SpaceXEndpoint.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

enum SpaceXEndpoint: Endpoint {
    case launches
    case rockets
    case dragons
    case landpads

    var path: String {
        switch self {
        case .launches: return "/v4/launches"
        case .rockets: return "/v4/rockets"
        case .dragons: return "/v4/dragons"
        case .landpads: return "/v4/landpads"
        }
    }

    var queryItems: [URLQueryItem] { [] }
    var method: HttpMethod { .get }
    var bodyParameters: Data? { nil }
}
