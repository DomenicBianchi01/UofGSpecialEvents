//
//  ResidencesViewController.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-20.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

class ResidencesViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Properties
    private let viewModel = ResidencesViewModel()
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate
extension ResidencesViewController: UITableViewDelegate { /* Not used */ }

// MARK: - UITableViewDataSource
extension ResidencesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.cellForRow(in: tableView, at: indexPath)
        
        if var cell = cell as? ResidenceLocationDelegatable {
            cell.delegate = self
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeader(in: section)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return viewModel.titleForFooter(in: section)
    }
}

// MARK: - ResidenceLocationDelegate
extension ResidencesViewController: ResidenceLocationDelegate {
    func residenceLocationSelected(id: Int) {
        if let tabBarController = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController,
            let mapController = tabBarController.viewControllers?[1].children.first as? MapViewController,
            let locationId = viewModel.residenceInfo?.residences.first(where: { $0.id == id })?.locationId {
            tabBarController.selectedIndex = 1
            mapController.selected(locationId: locationId)
        }
    }
}
