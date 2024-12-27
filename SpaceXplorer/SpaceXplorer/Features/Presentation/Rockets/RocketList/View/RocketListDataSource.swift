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
        tableview.register(cellType: BaseDetailTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.model.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rocket = viewModel?.model.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell: BaseDetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureWith(title: rocket.name, image: rocket.images[0])
        cell.selectionStyle = .none
        
        return cell
    }
}
