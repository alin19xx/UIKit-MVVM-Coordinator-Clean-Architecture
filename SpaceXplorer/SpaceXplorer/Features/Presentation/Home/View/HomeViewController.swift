//
//  HomeViewController.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel = DefaultHomeViewModel()
    var mainCoordinator: MainCoordinator?
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var dataSource: HomeDataSource = {
        HomeDataSource(tableview: tableView,
                             viewModel: viewModel)
    }()
    
    private lazy var delegate: HomeDelegate = {
       HomeDelegate(viewModel: viewModel)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SpaceX"
        
        self.setupView()
        self.setupBinding()
        
        viewModel.viewDidLoad()
    }
    
    private func setupBinding() {
        viewModel.sections.bind { [weak self] model in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.selectedSection.bind { [weak self] section in
            guard let self = self,
                  let section = section else { return }
            
            self.mainCoordinator?.navigateTo(section)
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
