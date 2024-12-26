//
//  DragonListDataSource.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation
import UIKit

final class DragonListDataSource: NSObject, UITableViewDataSource {
    
    private let tableview: UITableView
    private var viewModel: DragonListViewModel?
    
    init(tableview: UITableView, viewModel: DragonListViewModel) {
        self.tableview = tableview
        self.viewModel = viewModel
    }
    
    func registerCells() {
        tableview.register(cellType: DragonTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.model.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dragon = viewModel?.model.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell: DragonTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureWith(model: dragon)
        cell.selectionStyle = .none
        
        return cell
    }
}
