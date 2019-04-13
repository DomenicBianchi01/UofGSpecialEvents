//
//  EventTableViewCell.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-18.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell, EventViewModelable {
    // MARK: - Properties
    @IBOutlet private var eventTitle: UILabel!
    @IBOutlet private var eventLocation: UILabel!
    @IBOutlet private var eventTime: UILabel!
    
    // MARK: - Properties
    var viewModel: EventViewModel? {
        didSet {
            refreshCell()
        }
    }
    
    // MARK: - Lifecycle Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Helper Functions
    private func refreshCell() {
        guard let viewModel = viewModel else {
            return
        }

        eventTitle.text = viewModel.event.name
        eventLocation.text = viewModel.event.location
        eventTime.text = viewModel.event.date + " @ " + viewModel.event.startTime + " - " + viewModel.event.endTime
    }
}
