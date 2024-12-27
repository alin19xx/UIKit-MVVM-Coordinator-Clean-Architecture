//
//  LaunchesDataSource.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation
import UIKit

final class LaunchesDataSource: NSObject, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    private let tableview: UITableView
    private var viewModel: LaunchesViewModel?
    
    init(tableview: UITableView, viewModel: LaunchesViewModel) {
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
        guard let launch = viewModel?.model.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell: BaseDetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureWith(title: launch.name, image: launch.links.patch?.large ?? "")
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let dragons = viewModel?.model.value else { return }
        
        let lastIndex = dragons.count - 1
        if indexPaths.contains(where: { $0.row >= lastIndex }) {
            viewModel?.fetchNextPage()
        }
    }
}
