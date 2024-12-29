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
    var useCase: LandPadUseCase { get }
    
    func fetchNextPage()
}

@MainActor
protocol LandPadListViewModel: LandPadListViewModelInput, LandPadListViewModelOuput {}

@MainActor
final class DefaultLandPadListViewModel: BaseViewModel, LandPadListViewModel {
    var viewModelState: Box<ViewModelState> = Box(.idle)
    var model: Box<[LandPadModel]?> = Box(nil)
    var selectedLandPad: Box<LandPadModel?> = Box(nil)
    var showErrorAlert: Box<Bool?> = Box(nil)
    
    var useCase: LandPadUseCase

    init(useCase: LandPadUseCase = DefaultLandPadUseCase()) {
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
                model.value?.append(contentsOf: page.items.map { LandPadModel(from: $0) })
                
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
