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
    func viewDidLoad()
}

@MainActor
protocol LaunchesViewModelOuput {
    var model: Box<[LaunchModel]?> { get }
    var selectedLaunch: Box<LaunchModel?> { get }
    var showErrorAlert: Box<Bool?> { get set }
    var useCase: LaunchesUseCase { get }
    
    func fetchNextPage()
}

@MainActor
protocol LaunchesViewModel: LaunchesViewModelInput, LaunchesViewModelOuput {}

@MainActor
final class DefaultLaunchesViewModel: BaseViewModel, LaunchesViewModel {
    
    var model: Box<[LaunchModel]?> = Box(nil)
    var selectedLaunch: Box<LaunchModel?> = Box(nil)
    var showErrorAlert: Box<Bool?> = Box(nil)
    
    var useCase: LaunchesUseCase
    private var isFetching: Bool = false
    private var isFirstLoad: Bool = true

    init(useCase: LaunchesUseCase = DefaultLaunchesUseCase()) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        reloadData()
    }
    
    func reloadData() {
        useCase.resetPagination()
        model.value = nil
        isFirstLoad = true
        fetchNextPage()
    }
    
    func fetchNextPage() {
        guard !isFetching else { return }
        isFetching = true
        
        if isFirstLoad {
            showLoading()
        }
        
        Task {
            defer {
                isFetching = false
                if isFirstLoad {
                    hideLoading()
                    isFirstLoad = false
                }
            }
            
            do {
                let pageEntity = try await useCase.execute(limit: 10)
                let pageModel = PageModel(from: pageEntity)
                
                if var currentModel = model.value {
                    currentModel.append(contentsOf: pageModel.items.map { LaunchModel(from: $0) })
                    model.value = currentModel
                } else {
                    model.value = pageModel.items.map { LaunchModel(from: $0) }
                }
            } catch {
                showErrorAlert.value = true
            }
        }
    }
}
