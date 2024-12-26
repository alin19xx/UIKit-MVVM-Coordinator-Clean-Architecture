//
//  LandPadListDelegate.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import Foundation
import UIKit

final class LandPadListDelegate: NSObject, UITableViewDelegate {
    
    private var viewModel: LandPadListViewModel?
    
    init(viewModel: LandPadListViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedLandPad = viewModel?.model.value?[indexPath.row] {
            viewModel?.selectedLandPad.value = selectedLandPad
        }
    }
}
