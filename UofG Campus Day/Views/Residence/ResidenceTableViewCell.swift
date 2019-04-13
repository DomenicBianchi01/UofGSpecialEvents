//
//  ResidenceTableViewCell.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-20.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

class ResidenceTableViewCell: UITableViewCell, ResidenceViewModelable, ResidenceLocationDelegatable {
    // MARK: - IBOutlets
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var styleLabel: UILabel!
    @IBOutlet private var roomTypesImageView1: UIImageView!
    @IBOutlet private var roomTypesImageView2: UIImageView!
    @IBOutlet private var roomTypesImageView3: UIImageView!
    @IBOutlet private var roomTypesImageView4: UIImageView!
    
    // MARK: - Properties
    weak var delegate: ResidenceLocationDelegate? = nil
    var viewModel: ResidenceViewModel? {
        didSet {
            refreshCell()
        }
    }
    
    // MARK: - Lifecycle Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        roomTypesImageView1.image = nil
        roomTypesImageView2.image = nil
        roomTypesImageView3.image = nil
        roomTypesImageView4.image = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - IBActions
    @IBAction func showLocationButtonTapped(_ sender: Any) {
        guard let viewModel = viewModel else {
            return
        }
        
        delegate?.residenceLocationSelected(id: viewModel.residence.locationId)
    }
    
    // MARK: - Helper Functions
    private func refreshCell() {
        guard let viewModel = viewModel else {
            return
        }
        
        nameLabel.text = viewModel.residence.name
        styleLabel.text = "Residence Style: " + viewModel.residence.style.asString()
        
        let roomTypes = viewModel.residence.types
        var imageIndex = 1
        
        if roomTypes.contains(.single) {
            assignToNextEmptyImageView(index: imageIndex, imageName: "single")
            imageIndex += 1
        }
        if roomTypes.contains(.double) {
            assignToNextEmptyImageView(index: imageIndex, imageName: "double")
            imageIndex += 1
        }
        if roomTypes.contains(.triple) {
            assignToNextEmptyImageView(index: imageIndex, imageName: "triple")
            imageIndex += 1
        }
        if roomTypes.contains(.quad) {
            assignToNextEmptyImageView(index: imageIndex, imageName: "quad")
            imageIndex += 1
        }
    }
    
    private func assignToNextEmptyImageView(index: Int, imageName: String) {
        if index == 1 {
            roomTypesImageView1.image = UIImage(named: imageName)
        } else if index == 2 {
            roomTypesImageView2.image = UIImage(named: imageName)
        } else if index == 3 {
            roomTypesImageView3.image = UIImage(named: imageName)
        } else {
            roomTypesImageView4.image = UIImage(named: imageName)
        }
    }
}
