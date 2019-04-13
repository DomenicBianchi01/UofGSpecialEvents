//
//  Location.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-19.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

class Location: Decodable {
    // MARK: - Properties
    let id: Int
    let name: String
    let type: LocationType
    let latitude: Double
    let longitude: Double
    
    // MARK: - Computed Properties
    var tintColor: UIColor {
        if type == .academic {
            return .magenta
        } else if type == .food {
            return .blue
        } else if type == .parking {
            return .green
        } else if type == .residence {
            return .orange
        }
        return .red //general
    }
    
    // MARK: - Enums
    private enum Keys: String, CodingKey {
        case id
        case name
        case type
        case latitude = "lat"
        case longitude = "long"
    }
    
    enum LocationType: Int, CodingKey {
        case general = 1
        case academic
        case residence
        case parking
        case food
    }
    
    // MARK: - Lifecycle Functions
    init(id: Int,
         name: String,
         type: LocationType,
         latitude: Double,
         longitude: Double) {
        
        self.id = id
        self.name = name
        self.type = type
        self.latitude = latitude
        self.longitude = longitude
    }
    
    // MARK: - Decodable
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let type = try container.decode(Int.self, forKey: .type)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        
        self.init(id: id,
                  name: name,
                  type: LocationType(rawValue: type) ?? .general,
                  latitude: latitude,
                  longitude: longitude)
    }
}
