//
//  MatchedLocationTableViewCell.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-20.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

final class MatchedLocationTableViewCell: UITableViewCell, LocationViewModelable {
    // MARK: - IBOutlets
    @IBOutlet private var titleLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: LocationViewModel? {
        didSet {
            refreshCell()
        }
    }
    
    // MARK: - Lifecycle Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - Functions
    func refreshCell() {
        titleLabel.text = viewModel?.location.name
    }
}
