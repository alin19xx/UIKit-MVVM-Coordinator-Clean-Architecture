//
//  StarlinkMapViewModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 26/12/24.
//

import Foundation

@MainActor
final class DefaultStarlinkMapViewModel: BaseViewModel {
    private let useCase: StarlinkUseCase
    private(set) var model: Box<[StarlinkEntity]> = Box([])

    init(useCase: StarlinkUseCase = DefaultStarlinkUseCase()) {
        self.useCase = useCase
    }

    func fetchSatellites() {
        showLoading()
        Task {
            defer { hideLoading() }
            do {
                let newSatellites = try await useCase.execute()
                model.value.append(contentsOf: newSatellites)
            } catch {
                print("Error fetching satellites: \(error)")
            }
        }
    }
}
