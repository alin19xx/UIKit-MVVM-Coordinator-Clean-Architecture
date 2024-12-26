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
    case dragons
    case landpads

    var title: String {
        switch self {
        case .launches: return "Launches"
        case .rockets: return "Rockets"
        case .dragons: return "Spacecrafts"
        case .landpads: return "LandPad Locations"
        }
    }

    var subtitle: String {
        switch self {
        case .launches: return "Check out SpaceX launches"
        case .rockets: return "Technical details of the rockets"
        case .dragons: return "Information about Dragon spacecrafts"
        case .landpads: return "Landing locations on the map"
        }
    }
    
    var icon: String {
        switch self {
        case .launches: return "airplane.departure"
        case .rockets: return "flame"
        case .dragons: return "capsule"
        case .landpads: return "mappin.and.ellipse"
        }
    }
}
