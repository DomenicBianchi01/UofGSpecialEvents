//
//  EventsViewController.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-18.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

final class EventsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Properties
    private let viewModel = EventsViewModel()
    private var selectedRow: Int? = nil //TODO: Move to view model
    private var selectedSection: Int? = nil //TODO: Move to view model
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.decodeEvents()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isViewLoaded {
            viewModel.refreshStarredEvents()
            tableView.reloadData()
        }
    }
    
    // MARK: - Segue Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? EventInfoViewController, let selectedRow = selectedRow, let selectedSection = selectedSection, let event = viewModel.getEvent(in: selectedSection, at: selectedRow) {
            viewController.setEvent(event)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let selectedSection = selectedSection, let selectedRow = selectedRow else {
            return false
        }
        
        return viewModel.getEvent(in: selectedSection, at: selectedRow) != nil ? true : false
    }
}

// MARK: - UITableViewDelegate
extension EventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedRow = indexPath.row
        selectedSection = indexPath.section
        performSegue(withIdentifier: "eventDetailsSegue", sender: self)
    }
}

// MARK: - UITableViewDataSource
extension EventsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellForRow(in: tableView, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeader(in: section)
    }
}
