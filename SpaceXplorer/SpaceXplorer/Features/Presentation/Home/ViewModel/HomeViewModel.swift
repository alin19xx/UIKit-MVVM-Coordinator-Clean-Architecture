//
//  HomeViewModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

protocol HomeViewModelInput {
    func viewDidLoad()
}

protocol HomeViewModelOuput {
    var sections: Box<[HomeSection]?> { get }
    var selectedSection: Box<HomeSection?> { get }
}

protocol HomeViewModel: HomeViewModelInput, HomeViewModelOuput {}

final class DefaultHomeViewModel: HomeViewModel {
    
    var sections: Box<[HomeSection]?> = Box(nil)
    var selectedSection: Box<HomeSection?> = Box(nil)
    
    init() {}
    
    func viewDidLoad() {
        sections.value = [.rockets, .dragons, .landpads, .launches]
    }
}
