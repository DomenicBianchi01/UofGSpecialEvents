//
//  EventInfoViewController.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-18.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

final class EventInfoViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var starBarButtonItem: UIBarButtonItem!
    
    // MARK: - Properties
    private let viewModel = EventInfoViewModel()

    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.initStarred()
        setStarred()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    // MARK: - IBActions
    @IBAction func starSelected(_ sender: Any) {
        viewModel.eventStarred()
        setStarred()
    }
    
    // MARK: - Helper Functions
    func setEvent(_ event: Event) {
        viewModel.event = event
    }
    
    private func setStarred() {
        if viewModel.isStarred {
            starBarButtonItem.image = UIImage(named: "darkStar")
        } else {
            starBarButtonItem.image = UIImage(named: "star")
        }
    }
}

extension EventInfoViewController: UITableViewDelegate { /* Not used */ }

extension EventInfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellForRow(in: tableView, at: indexPath)
    }
}
