//
//  RocketListDelegate.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 19/12/24.
//

import Foundation
import UIKit

final class RocketListDelegate: NSObject, UITableViewDelegate {
    
    private var viewModel: RocketListViewModel?
    
    init(viewModel: RocketListViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedRocket = viewModel?.model.value?[indexPath.row] {
            viewModel?.selectedRocket.value = selectedRocket
        }
    }
}
