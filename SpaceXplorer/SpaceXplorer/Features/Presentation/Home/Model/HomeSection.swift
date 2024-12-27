//
//  HomeSection.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

enum HomeSection: CaseIterable {
    case launches
    case rockets
    case landpads
    case starlink

    var title: String {
        switch self {
        case .launches: return "Launches"
        case .rockets: return "Rockets"
        case .landpads: return "LandPad Locations"
        case .starlink: return "Starlink Locations"
        }
    }

    var subtitle: String {
        switch self {
        case .launches: return "Check out SpaceX launches"
        case .rockets: return "Technical details of the rockets"
        case .landpads: return "Landing locations on the map"
        case .starlink: return "Starlink locations on the map"
        }
    }
    
    var icon: String {
        switch self {
        case .launches: return "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png"
        case .rockets: return "https://imgur.com/DaCfMsj.jpg"
        case .landpads: return "https://i.imgur.com/KHBk6jO.png"
        case .starlink: return "https://farm5.staticflickr.com/4695/39718494114_6523797470_o.jpg"
        }
    }
}
