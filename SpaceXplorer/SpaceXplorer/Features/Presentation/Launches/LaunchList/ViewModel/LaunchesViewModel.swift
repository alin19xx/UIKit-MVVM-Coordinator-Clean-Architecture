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
    var viewModelState: Box<ViewModelState> { get }
    var showErrorAlert: Box<Bool?> { get set }
    var useCase: LaunchesUseCase { get }
    
    func fetchNextPage()
}

@MainActor
protocol LaunchesViewModel: LaunchesViewModelInput, LaunchesViewModelOuput {}

@MainActor
final class DefaultLaunchesViewModel: BaseViewModel, LaunchesViewModel {
    var viewModelState: Box<ViewModelState> = Box(.idle)
    var model: Box<[LaunchModel]?> = Box(nil)
    var selectedLaunch: Box<LaunchModel?> = Box(nil)
    var showErrorAlert: Box<Bool?> = Box(nil)
    
    var useCase: LaunchesUseCase

    init(useCase: LaunchesUseCase = DefaultLaunchesUseCase()) {
        self.useCase = useCase
    }

    func viewDidLoad() {
        reloadData()
    }

    func reloadData() {
        model.value = []
        fetchNextPage()
    }
    
    func fetchNextPage() {
        guard canFetchNextPage() else { return }
        viewModelState.value = viewModelState.value == .idle ? .loadingFirstPage : .loadingMore
        
        Task {
            do {
                let page = try await useCase.execute(limit: 10)
                model.value?.append(contentsOf: page.items.map { LaunchModel(from: $0) })
                
                viewModelState.value = page.hasNextPage ? .loaded : .idle
            } catch {
                viewModelState.value = .error("Failed to load launches.")
                showErrorAlert.value = true
            }
        }
    }
    
    func handleStateChange(_ state: ViewModelState) {
        switch state {
        case .loadingFirstPage:
            showLoading()
        case .loaded, .idle:
            hideLoading()
        case .loadingMore:
            break
        case .error:
            hideLoading()
        }
    }
    
    private func canFetchNextPage() -> Bool {
        switch viewModelState.value {
        case .loadingFirstPage, .loadingMore:
            return false
        default:
            return true
        }
    }
}
