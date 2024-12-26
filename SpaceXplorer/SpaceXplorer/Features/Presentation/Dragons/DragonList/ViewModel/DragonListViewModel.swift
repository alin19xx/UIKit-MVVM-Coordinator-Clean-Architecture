//
//  DragonListViewModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation

@MainActor
protocol DragonListViewModelInput {
    func viewDidLoad()
}

@MainActor
protocol DragonListViewModelOuput {
    var model: Box<[DragonModel]?> { get }
    var selectedDragon: Box<DragonModel?> { get }
    var showErrorAlert: Box<Bool?> { get set }
    var useCase: DragonsUseCase { get }
}

@MainActor
protocol DragonListViewModel: DragonListViewModelInput, DragonListViewModelOuput {}

@MainActor
final class DefaultDragonListViewModel: BaseViewModel, DragonListViewModel {
    
    var model: Box<[DragonModel]?> = Box(nil)
    var selectedDragon: Box<DragonModel?> = Box(nil)
    var showErrorAlert: Box<Bool?> = Box(nil)
    
    var useCase: DragonsUseCase
    
    init(useCase: DragonsUseCase = DefaultDragonsUseCase()) {
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
                model.value = fetchedRockets.map { DragonModel(from: $0) }
                hideLoading()
            } catch {
                hideLoading()
                showErrorAlert.value = true
            }
        }
    }
}
