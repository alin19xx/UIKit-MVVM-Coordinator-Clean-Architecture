//
//  LaunchesDelegate.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation
import UIKit

final class LaunchesDelegate: NSObject, UITableViewDelegate {
    
    private var viewModel: LaunchesViewModel?
    
    init(viewModel: LaunchesViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedLaunch = viewModel?.model.value?[indexPath.row] {
            viewModel?.selectedLaunch.value = selectedLaunch
        }
    }
}
