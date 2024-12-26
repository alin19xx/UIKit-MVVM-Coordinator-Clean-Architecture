//
//  HomeDelegate.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation
import UIKit

final class HomeDelegate: NSObject, UITableViewDelegate {
    
    private var viewModel: HomeViewModel?
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedStadium = viewModel?.sections.value?[indexPath.row] {
            viewModel?.selectedSection.value = selectedStadium
        }
    }
}
