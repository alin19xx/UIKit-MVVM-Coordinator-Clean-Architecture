//
//  HomeDataSource.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation
import UIKit

final class HomeDataSource: NSObject, UITableViewDataSource {
    
    private let tableview: UITableView
    private var viewModel: HomeViewModel?
    
    init(tableview: UITableView, viewModel: HomeViewModel) {
        self.tableview = tableview
        self.viewModel = viewModel
    }
    
    func registerCells() {
        tableview.register(cellType: BaseTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sections = viewModel?.sections.value
        
        if let section = sections?[indexPath.row] as? HomeSection {
            let cell: BaseTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configureWith(
                title: section.title,
                description: section.subtitle,
                imageURL: section.icon
            )
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
    }
}
