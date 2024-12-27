//
//  LandPadListViewController.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation
import UIKit

class LandPadListViewController: BaseViewController<DefaultLandPadListViewModel> {

    var mainCoordinator: MainCoordinator?
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var dataSource: LandPadListDataSource = {
        LandPadListDataSource(tableview: tableView,
                             viewModel: viewModel)
    }()
    
    private lazy var delegate: LandPadListDelegate = {
        LandPadListDelegate(viewModel: viewModel)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "LandPads"
        
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
        
        viewModel.selectedLandPad.bind { [weak self] landPad in
            guard let self = self, let landPad = landPad else { return }
            
            self.mainCoordinator?.navigateToDetails(for: landPad)
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
