//
//  LaunchesDataSource.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation
import UIKit

final class LaunchesDataSource: NSObject, UITableViewDataSource {
    
    private let tableview: UITableView
    private var viewModel: LaunchesViewModel?
    
    init(tableview: UITableView, viewModel: LaunchesViewModel) {
        self.tableview = tableview
        self.viewModel = viewModel
    }
    
    func registerCells() {
        tableview.register(cellType: LaunchTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.model.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let launch = viewModel?.model.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell: LaunchTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureWith(model: launch)
        cell.selectionStyle = .none
        
        return cell
    }
}
