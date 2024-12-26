//
//  LandPadListDataSource.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation
import UIKit

final class LandPadListDataSource: NSObject, UITableViewDataSource {
    
    private let tableview: UITableView
    private var viewModel: LandPadListViewModel?
    
    init(tableview: UITableView, viewModel: LandPadListViewModel) {
        self.tableview = tableview
        self.viewModel = viewModel
    }
    
    func registerCells() {
        tableview.register(cellType: LandPadTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.model.value?.count ?? 0 // Usar `model` en lugar de `allLaunches`
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let landPad = viewModel?.model.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell: LandPadTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureWith(model: landPad)
        cell.selectionStyle = .none
        
        return cell
    }
}
