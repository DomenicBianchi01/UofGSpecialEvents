//
//  LocationSearchViewController.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-20.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

class LocationSearchViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    var locations: [Location] = []
    private var matchedLocations: [Location] = []
    weak var delegate: LocationDelegate? = nil

    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK: - UISearchResultsUpdating
extension LocationSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else {
            return
        }
        
        matchedLocations = locations.filter { $0.name.lowercased().contains(searchText) }
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension LocationSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selected(locationId: matchedLocations[indexPath.row].id)
        dismiss(animated: true)
    }
}

// MARK: - UITableViewDataSource
extension LocationSearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchedLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchedLocationReuseIdentifier", for: indexPath)
        
        if var cell = cell as? LocationViewModelable {
            cell.viewModel = LocationViewModel(location: matchedLocations[indexPath.row])
        }
        
        return cell
    }
}
