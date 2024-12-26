//
//  RocketListDataSource.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 19/12/24.
//

import Foundation
import UIKit

final class RocketListDataSource: NSObject, UITableViewDataSource {
    
    private let tableview: UITableView
    private var viewModel: RocketListViewModel?
    
    init(tableview: UITableView, viewModel: RocketListViewModel) {
        self.tableview = tableview
        self.viewModel = viewModel
    }
    
    func registerCells() {
        tableview.register(cellType: RocketTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.model.value?.count ?? 0 // Usar `model` en lugar de `allLaunches`
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rocket = viewModel?.model.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell: RocketTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureWith(model: rocket)
        cell.selectionStyle = .none
        
        return cell
    }
}
