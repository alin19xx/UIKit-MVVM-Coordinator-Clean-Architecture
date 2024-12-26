//
//  LaunchesViewModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

enum LaunchFilterType {
    case all
    case past
    case upcoming
}

@MainActor
protocol LaunchesViewModelInput {
    var allLaunches: Box<[LaunchModel]> { get }
    func viewDidLoad()
}

@MainActor
protocol LaunchesViewModelOuput {
    var model: Box<[LaunchModel]?> { get }
    var selectedLaunch: Box<LaunchModel?> { get }
    var showErrorAlert: Box<Bool?> { get set }
    var useCase: LaunchesUseCase { get }
    
    func filterLaunches(type: LaunchFilterType)
}

@MainActor
protocol LaunchesViewModel: LaunchesViewModelInput, LaunchesViewModelOuput {}

@MainActor
final class DefaultLaunchesViewModel: BaseViewModel, LaunchesViewModel {
    
    var model: Box<[LaunchModel]?> = Box(nil)
    var allLaunches: Box<[LaunchModel]> = Box([])
    var selectedLaunch: Box<LaunchModel?> = Box(nil)
    var showErrorAlert: Box<Bool?> = Box(nil)
    
    var useCase: LaunchesUseCase
    
    init(useCase: LaunchesUseCase = DefaultLaunchesUseCase()) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        fetchAllLaunches()
    }
    
    func filterLaunches(type: LaunchFilterType) {
        let filteredLaunches = applyFilter(type: type)
        model.value = filteredLaunches
    }
    
    private func fetchAllLaunches() {
        showLoading()
        Task {
            defer { hideLoading() }
            do {
                let launches = try await useCase.execute()
                allLaunches.value = launches.map { LaunchModel(from: $0) }
                model.value = allLaunches.value
            } catch {
                showErrorAlert.value = true
            }
        }
    }
    
    private func applyFilter(type: LaunchFilterType) -> [LaunchModel] {
        switch type {
        case .all:
            return allLaunches.value
        case .past:
            return allLaunches.value.filter { !$0.isUpcoming }
        case .upcoming:
            return allLaunches.value.filter { $0.isUpcoming }
        }
    }
}
