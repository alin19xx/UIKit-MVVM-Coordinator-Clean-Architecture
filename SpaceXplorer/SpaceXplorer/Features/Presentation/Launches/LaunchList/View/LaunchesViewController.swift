//
//  LaunchesViewController.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import UIKit

class LaunchesViewController: BaseViewController<DefaultLaunchesViewModel> {
    
    var mainCoordinator: MainCoordinator?
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var dataSource: LaunchesDataSource = {
        LaunchesDataSource(tableview: tableView,
                             viewModel: viewModel)
    }()
    
    private lazy var delegate: LaunchesDelegate = {
       LaunchesDelegate(viewModel: viewModel)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Launches"
        
        self.setupView()
        self.setupBinding()
        
        viewModel.viewDidLoad()
    }
    
    private func setupBinding() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self else { return }
            if isLoading {
                self.showLoadingSpinner()
            } else {
                self.hideLoadingSpinner()
            }
        }
        
        viewModel.model.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.allLaunches.bind { [weak self] launches in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.selectedLaunch.bind { [weak self] launch in
            guard let self = self, let launch = launch else { return }
            
            self.mainCoordinator?.navigateToDetails(for: launch)
        }
    }

    private func setupView() {
        view.addSubview(tableView)
        
        setupTableView()
        setupNavigationBar()
        
        setupConstraints()
    }
    
    private func setupTableView() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
        dataSource.registerCells()
    }
    
    private func setupNavigationBar() {
        let filterMenu = UIMenu(title: "Filter Options", children: [
            UIAction(title: "All", image: UIImage(systemName: "list.bullet")) { [weak self] _ in
                self?.viewModel.filterLaunches(type: .all)
            },
            UIAction(title: "Past", image: UIImage(systemName: "clock.arrow.circlepath")) { [weak self] _ in
                self?.viewModel.filterLaunches(type: .past)
            },
            UIAction(title: "Upcoming", image: UIImage(systemName: "clock")) { [weak self] _ in
                self?.viewModel.filterLaunches(type: .upcoming)
            }
        ])
        
        let filterButton = UIBarButtonItem(title: "Filter", image: UIImage(systemName: "line.3.horizontal.decrease.circle"), primaryAction: nil, menu: filterMenu)
        
        navigationItem.rightBarButtonItem = filterButton
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
