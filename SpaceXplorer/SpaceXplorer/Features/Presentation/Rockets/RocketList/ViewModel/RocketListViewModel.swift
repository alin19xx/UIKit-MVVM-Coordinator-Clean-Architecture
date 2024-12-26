//
//  RocketListViewModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 19/12/24.
//

import Foundation

@MainActor
protocol RocketListViewModelInput {
    func viewDidLoad()
}

@MainActor
protocol RocketListViewModelOuput {
    var model: Box<[RocketModel]?> { get }
    var selectedRocket: Box<RocketModel?> { get }
    var showErrorAlert: Box<Bool?> { get set }
    var useCase: RocketsUseCase { get }
}

@MainActor
protocol RocketListViewModel: RocketListViewModelInput, RocketListViewModelOuput {}

@MainActor
final class DefaultRocketListViewModel: BaseViewModel, RocketListViewModel {
    
    var model: Box<[RocketModel]?> = Box(nil)
    var selectedRocket: Box<RocketModel?> = Box(nil)
    var showErrorAlert: Box<Bool?> = Box(nil)
    
    var useCase: RocketsUseCase
    
    init(useCase: RocketsUseCase = DefaultRocketsUseCase()) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        fetchRockets()
    }
    
    func fetchRockets() {
        showLoading()
        Task {
            do {
                let fetchedRockets = try await useCase.execute()
                model.value = fetchedRockets.map { RocketModel(from: $0) }
                hideLoading()
            } catch {
                hideLoading()
                showErrorAlert.value = true
            }
        }
    }
}
