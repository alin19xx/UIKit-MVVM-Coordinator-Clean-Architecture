//
//  DragonListDelegate.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation
import UIKit

final class DragonListDelegate: NSObject, UITableViewDelegate {
    
    private var viewModel: DragonListViewModel?
    
    init(viewModel: DragonListViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedDragon = viewModel?.model.value?[indexPath.row] {
            viewModel?.selectedDragon.value = selectedDragon
        }
    }
}
