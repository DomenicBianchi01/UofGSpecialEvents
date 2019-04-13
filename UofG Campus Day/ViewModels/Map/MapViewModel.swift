//
//  MapViewModel.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-19.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import Foundation

final class MapViewModel {
    // MARK: - Properties
    private(set) var locations: [Location] = []
    
    // MARK: - Lifecycle Functions
    init() {
        do {
            locations = try JSONService.getData(from: "locations", type: Locations.self).locations
        } catch {
            print(error)
        }
    }
}
