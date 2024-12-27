//
//  MainCoordinator.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

final class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let home = HomeViewController()
        home.mainCoordinator = self
        
        self.navigationController.pushViewController(home, animated: true)
    }
    
    @MainActor func navigateTo(_ section: HomeSection) {
        switch section {
        case .launches:
            let launches = LaunchesViewController(viewModel: DefaultLaunchesViewModel())
            launches.mainCoordinator = self
            
            self.navigationController.pushViewController(launches, animated: true)
        case .rockets:
            let rocketsVC = RocketListViewController(viewModel: DefaultRocketListViewModel())
            rocketsVC.mainCoordinator = self
            
            self.navigationController.pushViewController(rocketsVC, animated: true)
        case .landpads:
            let landpadsVC = LandPadListViewController(viewModel: DefaultLandPadListViewModel())
            landpadsVC.mainCoordinator = self
            
            self.navigationController.pushViewController(landpadsVC, animated: true)
        case .starlink:
            let starlinkVC = StarlinkMapViewController(viewModel: DefaultStarlinkMapViewModel())
            starlinkVC.mainCoordinator = self
            
            self.navigationController.pushViewController(starlinkVC, animated: true)
        }
    }
    
    func navigateToDetails(for launch: LaunchModel) {
        let detailVC = LaunchDetailViewController()
        detailVC.launch = launch
        detailVC.mainCoordinator = self
        
        self.navigationController.pushViewController(detailVC, animated: true)
    }
    
    func navigateToDetails(for rocket: RocketModel) {
        let detailVC = RocketDetailViewController(rocket: rocket)
        detailVC.mainCoordinator = self
        
        self.navigationController.pushViewController(detailVC, animated: true)
    }
    
    func navigateToDetails(for landPad: LandPadModel) {
        let detailVC = LandPadDetailViewController(landPad: landPad)
        detailVC.mainCoordinator = self
        
        self.navigationController.pushViewController(detailVC, animated: true)
    }
    
    func dismissViewController() {
        self.navigationController.dismiss(animated: true)
    }
}
