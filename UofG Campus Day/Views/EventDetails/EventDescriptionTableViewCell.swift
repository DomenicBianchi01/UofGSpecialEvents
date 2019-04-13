//
//  EventDescriptionTableViewCell.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-18.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

class EventDescriptionTableViewCell: UITableViewCell, EventViewModelable {
    // MARK: - IBOutlets
    @IBOutlet private var eventDescription: UILabel!
    
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
        eventDescription.text = viewModel?.event.description
    }
}
