//
//  ResidenceLocationDelegate.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-20.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import Foundation

protocol ResidenceLocationDelegate: class {
    func residenceLocationSelected(id: Int)
}

protocol ResidenceLocationDelegatable {
    var delegate: ResidenceLocationDelegate? { get set }
}
