//
//  LandPadListViewModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation

@MainActor
protocol LandPadListViewModelInput {
    func viewDidLoad()
}

@MainActor
protocol LandPadListViewModelOuput {
    var model: Box<[LandPadModel]?> { get }
    var selectedLandPad: Box<LandPadModel?> { get }
    var showErrorAlert: Box<Bool?> { get set }
    var useCase: LandPadsUseCase { get }
}

@MainActor
protocol LandPadListViewModel: LandPadListViewModelInput, LandPadListViewModelOuput {}

@MainActor
final class DefaultLandPadListViewModel: BaseViewModel, LandPadListViewModel {
    
    var model: Box<[LandPadModel]?> = Box(nil)
    var selectedLandPad: Box<LandPadModel?> = Box(nil)
    var showErrorAlert: Box<Bool?> = Box(nil)
    
    var useCase: LandPadsUseCase
    
    init(useCase: LandPadsUseCase = DefaultLandPadsUseCase()) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        fetchLandpads()
    }
    
    func fetchLandpads() {
        showLoading()
        Task {
            defer { hideLoading() }
            do {
                let fetchedLandPads = try await useCase.execute()
                model.value = fetchedLandPads.map { LandPadModel(from: $0) }
            } catch {
                showErrorAlert.value = true
            }
        }
    }
}
