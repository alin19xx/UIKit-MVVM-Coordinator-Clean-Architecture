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
    private var isFetching: Bool = false
    private var isFirstLoad: Bool = true // Nuevo estado para diferenciar la primera carga

    init(useCase: LandPadsUseCase = DefaultLandPadsUseCase()) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        reloadData()
    }
    
    func reloadData() {
        useCase.resetPagination()
        model.value = nil
        isFirstLoad = true // Reiniciar el estado al recargar
        fetchLandpads()
    }
    
    func fetchLandpads() {
        guard !isFetching else { return }
        isFetching = true
        
        // Mostrar el spinner solo durante la primera carga
        if isFirstLoad {
            showLoading()
        }
        
        Task {
            defer {
                isFetching = false
                if isFirstLoad {
                    hideLoading()
                    isFirstLoad = false // Cambiar el estado después de la primera carga
                }
            }
            
            do {
                let pageEntity = try await useCase.execute(limit: 10)
                let pageModel = PageModel(from: pageEntity)
                
                // Añadir los nuevos elementos al modelo existente
                if var currentModels = model.value {
                    currentModels.append(contentsOf: pageModel.items.map { LandPadModel(from: $0) })
                    model.value = currentModels
                } else {
                    model.value = pageModel.items.map { LandPadModel(from: $0) }
                }
            } catch {
                showErrorAlert.value = true
            }
        }
    }
}
