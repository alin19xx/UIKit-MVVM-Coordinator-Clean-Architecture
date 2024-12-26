//
//  RocketListViewController.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 19/12/24.
//

import UIKit

class RocketListViewController: BaseViewController<DefaultRocketListViewModel> {
    
    var mainCoordinator: MainCoordinator?
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var dataSource: RocketListDataSource = {
        RocketListDataSource(tableview: tableView,
                             viewModel: viewModel)
    }()
    
    private lazy var delegate: RocketListDelegate = {
        RocketListDelegate(viewModel: viewModel)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rockets"
        
        self.setupView()
        self.setupBinding()
        
        viewModel.viewDidLoad()
    }
    
    private func setupBinding() {
        viewModel.model.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.selectedRocket.bind { [weak self] rocket in
            guard let self = self, let rocket = rocket else { return }
            
            self.mainCoordinator?.navigateToDetails(for: rocket)
        }
    }

    private func setupView() {
        view.addSubview(tableView)
        
        setupTableView()
        
        setupConstraints()
    }
    
    private func setupTableView() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
        dataSource.registerCells()
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
