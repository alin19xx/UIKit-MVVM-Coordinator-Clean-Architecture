//
//  PageResponse.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 26/12/24.
//

import Foundation

struct PageResponse<T: Decodable>: Decodable {
    let docs: [T]
    let totalDocs: Int
    let limit: Int
    let offset: Int
    let hasNextPage: Bool
    let hasPrevPage: Bool
}
