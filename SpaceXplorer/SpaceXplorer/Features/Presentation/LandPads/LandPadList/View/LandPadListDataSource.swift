//
//  LandPadListDataSource.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation
import UIKit

final class LandPadListDataSource: NSObject, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    private let tableview: UITableView
    private var viewModel: LandPadListViewModel?
    
    init(tableview: UITableView, viewModel: LandPadListViewModel) {
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
        guard let landPad = viewModel?.model.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell: BaseDetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureWith(title: landPad.name, image: landPad.images[0])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let landPads = viewModel?.model.value else { return }
        
        let lastIndex = landPads.count - 1
        if indexPaths.contains(where: { $0.row >= lastIndex }) {
            viewModel?.fetchNextPage()
        }
    }
}
