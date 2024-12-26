//
//  BaseViewModel.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 24/12/24.
//

import Foundation

@MainActor
protocol BaseViewModelProtocol {
    var isLoading: Box<Bool> { get set }
    func showLoading()
    func hideLoading()
}

@MainActor
class BaseViewModel: BaseViewModelProtocol {
    var isLoading: Box<Bool> = Box(false)
    
    func showLoading() {
        isLoading.value = true
    }
    
    func hideLoading() {
        isLoading.value = false
    }
}
